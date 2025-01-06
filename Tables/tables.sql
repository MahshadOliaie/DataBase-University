

-- جدول اعضا
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    MembershipType ENUM('Monthly', 'Yearly') NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);


-- جدول مربیان
CREATE TABLE Coaches (
    CoachID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);



-- جدول تخصص ها
CREATE TABLE Specialties (
    SpecialtyID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL
);



-- (ارتباط مربیان و تخصص‌ها) جدول واسط 
CREATE TABLE CoachSpecialties (
    CoachID INT NOT NULL,
    SpecialtyID INT NOT NULL,
    FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID),
    FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID),
    PRIMARY KEY (CoachID, SpecialtyID)
);


-- جدول کلاس ها
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY AUTO_INCREMENT,
    ClassName VARCHAR(100) NOT NULL,
    Schedule VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    CoachID INT NOT NULL,
    FOREIGN KEY (CoachID) REFERENCES Coaches(CoachID)
);



-- جدول ثبت نام ها
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    EnrollDate DATE NOT NULL,
    MemberID INT NOT NULL,
    ClassID INT NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);



-- جدول پرداخت ها
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    PaymentDate DATE NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);