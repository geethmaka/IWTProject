-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2020 at 10:20 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinemarketstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigneddelivery`
--

CREATE TABLE `assigneddelivery` (
  `DP_ID` int(10) NOT NULL,
  `OID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assigneddelivery`
--

INSERT INTO `assigneddelivery` (`DP_ID`, `OID`) VALUES
(6, 19),
(6, 20),
(6, 21),
(6, 22);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CID` int(5) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Phonenumber` varchar(11) NOT NULL,
  `Address` varchar(30) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Cardtype` varchar(10) NOT NULL,
  `Cardno` varchar(16) DEFAULT NULL,
  `Expirydate` date NOT NULL,
  `CVV` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CID`, `firstname`, `lastname`, `NIC`, `Email`, `Password`, `Phonenumber`, `Address`, `City`, `Cardtype`, `Cardno`, `Expirydate`, `CVV`) VALUES
(5, 'Ajith', 'Danapala', '691264785v', 'customer@gmail.com', 'Password$123', '123456789', 'Pilimathalawa', 'Kandy', 'visa', '2147483647', '2020-10-01', 111),
(7, 'Nipun', 'Senarath', '200017902852', 'nipun@gmail.com', 'Nipun2000', '94773969049', 'No.70 Weligalla road', 'Mawanella', 'visa', '1234123412341234', '2020-12-01', 123);

-- --------------------------------------------------------

--
-- Table structure for table `deliveryperson`
--

CREATE TABLE `deliveryperson` (
  `DP_ID` int(5) NOT NULL,
  `User_name` varchar(20) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  `Password` varchar(20) NOT NULL,
  `Vehical_No` varchar(10) NOT NULL,
  `Location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliveryperson`
--

INSERT INTO `deliveryperson` (`DP_ID`, `User_name`, `NIC`, `Email`, `Phone_number`, `Password`, `Vehical_No`, `Location`) VALUES
(6, 'Sunil Samarakoon', '697598464v', 'deliveryp@buyme.com', 910123456, 'Password#person', 'JJ-2222', 'Kandy'),
(7, 'Sanath Amarakoon', '697598864v', 'deliveryp1@buyme.com', 910123456, 'Password#person', 'KJ-7895', 'Mawanella');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `FID` int(5) NOT NULL,
  `Topic` varchar(200) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `CID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`FID`, `Topic`, `Description`, `CID`) VALUES
(2, 'Seller shipping ', 'The shipping is too late. I didnt receive the item still.', 7);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `Item_number` int(5) NOT NULL,
  `SID` int(5) NOT NULL,
  `Item_Name` varchar(20) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Unit_Price` float NOT NULL,
  `Discount` float DEFAULT NULL,
  `Category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`Item_number`, `SID`, `Item_Name`, `Description`, `Quantity`, `Unit_Price`, `Discount`, `Category`) VALUES
(5, 6, 'Wireless Mouse', 'Logitech Wireless Mouse', 100, 500, 0, 'Electronics'),
(6, 6, 'Micro SD card 64GB', 'Micro SD card 64GB', 150, 1000, 0, 'Electronics'),
(11, 6, 'Micro SD card 32GB', 'Micro SD card 32GB', 150, 1000, 0, 'Electronics'),
(12, 7, 'Gold chain', '24K gold chain', 5, 0, 0, 'JewelryWatches');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL,
  `Item_number` int(5) NOT NULL,
  `OID` int(5) NOT NULL,
  `Quantity` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `Item_number`, `OID`, `Quantity`) VALUES
(9, 4, 19, '10'),
(14, 4, 20, '1'),
(15, 5, 21, '2'),
(16, 5, 22, '2'),
(17, 5, 23, '5');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OID` int(5) NOT NULL,
  `CID` int(5) NOT NULL,
  `TotalPrice` int(11) NOT NULL,
  `Status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OID`, `CID`, `TotalPrice`, `Status`) VALUES
(19, 5, 10000, 'Active'),
(20, 5, 1000, 'Active'),
(21, 5, 2000, 'Active'),
(22, 7, 1000, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pID` int(5) NOT NULL,
  `OID` int(5) NOT NULL,
  `CID` int(5) NOT NULL,
  `SID` int(5) NOT NULL,
  `Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `SID` int(5) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Phonenumber` int(11) NOT NULL,
  `Business_name` varchar(20) NOT NULL,
  `B_Email` varchar(30) NOT NULL,
  `Bank` varchar(20) NOT NULL,
  `Branch` varchar(20) NOT NULL,
  `AccountNo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`SID`, `FullName`, `NIC`, `Email`, `Password`, `Phonenumber`, `Business_name`, `B_Email`, `Bank`, `Branch`, `AccountNo`) VALUES
(6, 'Senarath Samarasinghe', '602375896v', 'seller@gmail.com', 'Password#123', 123456789, 'Senarath Electronics', 'info@senarathe.com', 'Sampath Bank', 'Kandy', 2147483647),
(7, 'Rohan Jayapala', '200102020203', 'rohan@gmail.com', 'Password#123', 123456789, 'Rohan jewellery', 'test@test.com', 'Sampath', 'Colombo', 2147483647),
(8, 'hirosha samarasekara', '200029400286', 'hirosha@gmail.com', '#Hiro2000#', 2147483647, 'panama enterprises', 'panama@gmail.com', 'sampath', 'kandy', 123123123);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Staff_ID` int(5) NOT NULL,
  `User_name` varchar(200) NOT NULL,
  `NIC` varchar(12) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone_number` int(10) DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `User_name`, `NIC`, `Email`, `Phone_number`, `Password`, `Type`) VALUES
(7, 'Geethmaka Dissanayake', '200102201108', 'admin@buyme.com', 710891055, 'Password', 'admin'),
(8, 'Pamuditha Kekulandara', '200020202020', 'deliveryh@buyme.com', 710123456, 'Password#delivery', 'DeliveryM'),
(9, 'Ajith Rathnayake', '200103030303', 'paymenth@gmail.com', 810123456, 'Password#payment', 'PaymentH'),
(10, 'Sunil Samarakoon', '697598464v', 'deliveryp@buyme.com', 910123456, 'Password#person', 'DeliveryP'),
(12, 'Sample  Staff1', '200102201108', 'sample@gmail.com', 123456789, 'Password#sample', 'Admin'),
(13, 'Samaple Staff', '20001790285', 'member@gmail.com', 773969049, 'Password#123', 'Admin'),
(15, 'Sanath Amarakoon', '697598464v', 'deliveryp1@buyme.com', 910123456, 'Password#person', 'DeliveryP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigneddelivery`
--
ALTER TABLE `assigneddelivery`
  ADD UNIQUE KEY `OID` (`OID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  ADD PRIMARY KEY (`DP_ID`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`FID`),
  ADD KEY `FK_Feedback` (`CID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Item_number`),
  ADD KEY `FK_SItem` (`SID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OID`),
  ADD KEY `FK_Order` (`CID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `FK_OPayment` (`OID`),
  ADD KEY `FK_CPayment` (`CID`),
  ADD KEY `FK_SPayment` (`SID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`SID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `deliveryperson`
--
ALTER TABLE `deliveryperson`
  MODIFY `DP_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `FID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `Item_number` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pID` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `SID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Staff_ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `FK_Feedback` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_SItem` FOREIGN KEY (`SID`) REFERENCES `seller` (`SID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Order` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_CPayment` FOREIGN KEY (`CID`) REFERENCES `customer` (`CID`),
  ADD CONSTRAINT `FK_OPayment` FOREIGN KEY (`OID`) REFERENCES `orders` (`OID`),
  ADD CONSTRAINT `FK_SPayment` FOREIGN KEY (`SID`) REFERENCES `seller` (`SID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
