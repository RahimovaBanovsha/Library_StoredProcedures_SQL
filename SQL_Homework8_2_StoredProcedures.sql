--- STORED PROCEDURES ---

--- STORED PROCEDURE 1 ---
Create procedure sp_CalculateFactorial
	@Number int,@Result bigint output
as
Begin
	Set Nocount On

	If @Number<0
	Begin
		Print 'Invalid input!'
		Raiserror('Factorial of a negative number does not exist.', 16, 1)
		Set @Result=null
		Return 1
	End
	Declare @i int =1
	Set @Result=1

	While @i<=@Number
	Begin
		Set @Result=@Result*@i
		Set @i=@i+1
	End
	Return 0
End

Declare @result bigint
Declare @errorCode int

Exec @errorCode=sp_CalculateFactorial @Number=6, @Result=@result output

Print 'Result: '+ Cast (@result as varchar)
Print 'Error Code: '+ Cast (@errorCode as varchar)

--- STORED PROCEDURE 2 ---
Create procedure sp_LazyStudents
	@LazyCount int output
as
Begin
	Set Nocount on

	Select s.Id,s.FirstName,s.LastName from Students s
	Where not exists(
		Select 1 from S_cards sc 
		where sc.Id_Student=s.Id)

	Set @LazyCount=@@ROWCOUNT
End

Declare @count int
Exec sp_LazyStudents @LazyCount=@count output
Print 'Lazy Students Count: '+ Cast(@count as varchar)

--- STORED PROCEDURE 3 ---
Create procedure sp_BooksByCriterias
	@AuthorFirstName nvarchar(50),
	@AuthorLastName nvarchar(50),
	@Theme nvarchar(50),
	@Category nvarchar(50),
	@SortColumn int,
	@SortDirection nvarchar(4)
as
Begin
	Set Nocount on

	Select b.Id as BookId, b.Name as BookTitle, a.LastName+' '+a.FirstName as Author,
	t.Name as Theme, c.Name as Category into #BookList from Books b
	Join Authors a on a.Id=b.Id_Author
	Join Themes t on t.Id=b.Id_Themes
	Join Categories c on c.Id=b.Id_Category
	Where a.FirstName like '%'+@AuthorFirstName+'%' and 
       a.LastName like '%'+@AuthorLastName+'%' and
       t.Name like '%'+@Theme+'%' and 
       c.Name like '%'+@Category+'%'

	Declare @OrderColumn nvarchar(50)
	Set @OrderColumn=
		Case @SortColumn
			When 1 then 'BookId'
            When 2 then 'BookTitle'
            When 3 then 'Author'
            When 4 then 'Theme'
            When 5 then 'Category'
        End

	Declare @sql nvarchar(MAX)
	Set @sql='Select * from #BookList Order by ' + Quotename(@OrderColumn)+' '+@SortDirection
	Exec sp_executesql @sql
End

Exec sp_BooksByCriterias 
    @AuthorFirstName = '', 
    @AuthorLastName = '', 
    @Theme = 'Programming', 
    @Category = 'C ++ Builder', 
    @SortColumn = 2, 
    @SortDirection = 'DESC'

--- STORED PROCEDURE 4 ---
Create procedure sp_AddStudentWithGroup
    @FirstName nvarchar(50),
    @LastName nvarchar(50),
    @GroupName nvarchar(50),
    @Term int,
    @IdFaculty int
As
Begin
    Set Nocount On

    Declare @UpperGroupName nvarchar(50) = Upper(@GroupName)
    Declare @GroupId int, @NewGroupId int, @NewStudentId int

    Select @GroupId = Id from Groups 
    Where Upper(Name) = @UpperGroupName

    If @GroupId Is Null
    Begin
        Select @NewGroupId = Isnull(Max(Id), 0) + 1 from Groups
        Insert Into Groups(Id, Name, Id_Faculty)
        Values (@NewGroupId, @UpperGroupName, @IdFaculty)
        Set @GroupId = @NewGroupId
    End
    Select @NewStudentId = Isnull(Max(Id), 0) + 1 from Students

    Insert Into Students(Id, FirstName, LastName, Id_Group, Term)
    Values (@NewStudentId, @FirstName, @LastName, @GroupId, @Term)

End

Exec sp_AddStudentWithGroup 
    @FirstName = 'Raul',
    @LastName = 'Rustamzade',
    @GroupName = '20Q5',
    @Term = 2,
    @IdFaculty = 1

Select * From Groups Where Name = '20Q5'
Select * From Students Where LastName = 'Rahimova'

--- STORED PROCEDURE 5 ---
Create procedure sp_PurchasePopularBooks
as
Begin
    Set Nocount On

    Select Top 5 b.Id
    Into #PopularBooks from Books b
    Where b.Id In (Select Distinct Id_Book From S_Cards) and
          b.Id In (Select Distinct Id_Book From T_Cards)
    Group By B.Id
    Order By 
        (Select Count(*) From S_Cards Where Id_Book = B.Id) +
        (Select Count(*) From T_Cards Where Id_Book = B.Id) Desc

    Update Books
    Set Quantity = Quantity + 3
    Where Id In (Select Id From #PopularBooks)
    Select Id, Name, Quantity from Books 
    Where Id In (Select Id From #PopularBooks)
End

Exec sp_PurchasePopularBooks

--- STORED PROCEDURE 6 ---
Create table DonatedBooks (
    Id int Identity(1,1) Primary Key,
    DonatedCount Int Not Null Check (DonatedCount > 0),
    DonationDate Datetime Default GetDate(),
    Id_Book Int Not Null 
    Foreign Key References Books(Id),
)

Create Procedure sp_RemoveUnpopularBooks
As
Begin
    Set Nocount On

    Declare @BookId Int, @Quantity Int, @DonateCount int
    Declare unpopular_cursor Cursor For

    Select Top 5 b.Id, B.Quantity from Books b
    Left Join S_Cards Sc On Sc.Id_Book = b.Id
    Left Join T_Cards Tc On Tc.Id_Book = b.Id

    Group By b.Id, b.Quantity
    Order By 
        (Select Count(*) from S_Cards Where Id_Book = b.Id) + 
        (Select Count(*) from T_Cards Where Id_Book = b.Id) Asc

    Open unpopular_cursor
    Fetch Next From unpopular_cursor Into @BookId, @Quantity

    While @@Fetch_Status = 0
    Begin
        Set @DonateCount = @Quantity / 2

        If @DonateCount >= 1
        Begin
            Insert Into DonatedBooks (Id_Book, DonatedCount)
            Values (@BookId, @DonateCount)

            Update Books
            Set Quantity = Quantity - @DonateCount
            Where Id = @BookId
        End

        Fetch Next From unpopular_cursor Into @BookId, @Quantity
    End

    Close unpopular_cursor
    Deallocate unpopular_cursor
End

Exec sp_RemoveUnpopularBooks
Select * From DonatedBooks

Update Books Set Quantity = 6 Where Id in (1, 2, 3, 4, 5)
Exec sp_RemoveUnpopularBooks

Select * From DonatedBooks
Select * From Books

--- STORED PROCEDURE 7 ---
Create procedure sp_StudentTakeBook
    @StudentId Int,
    @BookId Int,
    @LibId int
as
Begin
    Set Nocount On

    Declare @BookQty Int, @CurrentBooks Int

    Select @BookQty = Quantity from Books 
    Where Id = @BookId

    If @BookQty Is Null
    Begin
        Print 'Book not found!'
        Return
    End

    If @BookQty <= 0
    Begin
        Print 'Book is not available!'
        Return
    End

    Select @CurrentBooks = Count(*) from S_Cards
    Where Id_Student = @StudentId and DateIn is Null

    If @CurrentBooks >= 5
    Begin
        Print 'Student has already taken 5 books. Cannot take more.'
        Return
    End

    If @CurrentBooks >= 3
    Begin
        Print 'Warning: Student has already taken 3 or 4 books.'
    End

    Declare @NewId int
    Select @NewId = ISNULL(Max(Id), 0) + 1 from S_Cards  

    Insert Into S_Cards(Id, Id_Student, Id_Book, Id_Lib, DateOut)
    Values(@NewId, @StudentId, @BookId, @LibId, GetDate()) 

    Update Books 
    Set Quantity = Quantity - 1 
    Where Id = @BookId

    Print 'Book has been successfully issued.'
End

Exec sp_StudentTakeBook @StudentId = 7, @BookId = 2, @LibId=1

--- STORED PROCEDURE 8 ---
Create procedure sp_TeacherTakeBook
    @TeacherId int,
    @BookId int,
    @LibraryId int
as
Begin
    Set Nocount On

    Declare @BookQuantity int
    Select @BookQuantity = Quantity from Books where Id = @BookId

    If @BookQuantity is Null
    Begin
        Print 'Book not found.'
        Return
    End

    If @BookQuantity <= 0
    Begin
        Print 'Book is currently unavailable.'
        Return
    End

    Declare @BookCount int
    Select @BookCount = Count(*) from T_Cards 
    where Id_Teacher = @TeacherId and DateIn is Null

    If @BookCount >= 5
    Begin
        Print 'Teacher already has 5 books. Cannot take more.'
        Return
    End

    If @BookCount >= 3
    Begin
        Print 'Warning: Teacher already has 3 or more books.'
    End

    Declare @NewId int
    Select @NewId = Isnull(Max(Id), 0) + 1 from T_Cards

    insert into T_Cards (Id, Id_Teacher, Id_Book, Id_Lib, DateOut, DateIn)
    values (@NewId, @TeacherId, @BookId, @LibraryId, Getdate(), Null)

    Update Books Set Quantity = Quantity - 1 where Id = @BookId

    Print 'Book successfully given to teacher.'
End

Select * from T_Cards where Id_Teacher = 3 and DateIn is null
update Books set Quantity = 5 where Id = 4

Exec sp_TeacherTakeBook 
    @TeacherId = 3,
    @BookId = 13,
    @LibraryId = 1

Exec sp_TeacherTakeBook 
    @TeacherId = 2,
    @BookId = 5,
    @LibraryId = 1

Exec sp_TeacherTakeBook 
    @TeacherId = 1,
    @BookId = 103,
    @LibraryId = 1

--- STORED PROCEDURE 9 ---
Create procedure sp_StudentReturnBook
    @StudentId int,
    @BookId int
as
Begin
    Set Nocount on

    Declare @CardId int
    Declare @DateOut date
    Declare @Now date = getdate()

    Select top 1 @CardId = Id, @DateOut = DateOut from S_Cards
    where Id_Student = @StudentId
      and Id_Book = @BookId
      and DateIn is null

    if @CardId is null
    Begin
        Print 'This student has no such book to return or it is already returned.'
        Return
    End

    Update S_Cards
    Set DateIn = @Now
    where Id = @CardId

    Update Books
    Set Quantity = Quantity + 1
    where Id = @BookId

    if datediff(day, @DateOut, @Now) > 365
    Begin
        print 'Warning: The student has kept the book for more than a year and must pay a fine.'
    End
    Else
    Begin
        print 'Book successfully returned.'
    End
End

Exec sp_StudentReturnBook @StudentId = 1, @BookId = 9
Exec sp_StudentReturnBook @StudentId = 16, @BookId = 14
Exec sp_StudentReturnBook @StudentId = 7, @BookId = 2

--- STORED PROCEDURE 10 ---
Create Procedure sp_TeacherReturnBook
    @TeacherId Int,
    @BookId Int
as
Begin
    Set Nocount On

    Declare @CardId Int
    Declare @DateOut Date
    Declare @Now Date = GetDate()

    Select Top 1 @CardId = Id, @DateOut = DateOut from T_Cards
    Where Id_Teacher = @TeacherId
      And Id_Book = @BookId
      And DateIn Is Null

    If @CardId Is Null
    Begin
        Print 'This teacher has no such book to return or it is already returned.'
        Return
    End

    Update T_Cards
    Set DateIn = @Now
    Where Id = @CardId

    Update Books
    Set Quantity = Quantity + 1
    Where Id = @BookId

    If Datediff(Day, @DateOut, @Now) > 365
    Begin
        Print 'Warning: The teacher has kept the book for more than a year and must pay a fine.'
    End
    Else
    Begin
        Print 'Book successfully returned by teacher.'
    End
End

Exec sp_TeacherReturnBook @TeacherId = 12, @BookId = 17
Exec sp_TeacherReturnBook @TeacherId = 2, @BookId = 13
Exec sp_TeacherReturnBook @TeacherId = 3, @BookId = 6
