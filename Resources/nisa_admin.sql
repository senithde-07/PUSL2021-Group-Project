-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 06:46 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nisa_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_staff`
--

CREATE TABLE `academic_staff` (
  `staff_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_staff`
--

INSERT INTO `academic_staff` (`staff_id`, `name`, `email`, `mobile`, `dept_id`) VALUES
(1, 'Pramudya Thilakarathne', 'pramudya.h@nsbm.ac.lk', '0786545672', 1),
(2, 'Chamindra Attanayake', 'chamindra.a@nsbm.ac.lk', '0745623457', 2);

-- --------------------------------------------------------

--
-- Table structure for table `active_batches`
--

CREATE TABLE `active_batches` (
  `batch_number` decimal(3,1) NOT NULL,
  `intake_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `active_batches`
--

INSERT INTO `active_batches` (`batch_number`, `intake_date`) VALUES
('21.1', '2021-06-15'),
('21.2', '2021-09-10');

-- --------------------------------------------------------

--
-- Table structure for table `admin_account`
--

CREATE TABLE `admin_account` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_account`
--

INSERT INTO `admin_account` (`admin_id`, `email`, `password`) VALUES
(1, 'nsbmnisa@gmail.com', '4cc3c7251752fa4c9c9431dd2907fec0');

-- --------------------------------------------------------

--
-- Table structure for table `daily_hall_allocation`
--

CREATE TABLE `daily_hall_allocation` (
  `day` date NOT NULL,
  `timetable_link` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daily_hall_allocation`
--

INSERT INTO `daily_hall_allocation` (`day`, `timetable_link`) VALUES
('2023-04-07', 'google'),
('2023-04-10', 'youtube'),
('2023-04-20', 'xkjsnxkjlnkjsdxnkj');

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `degree_id` int(11) NOT NULL,
  `degree_name` varchar(60) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degree`
--

INSERT INTO `degree` (`degree_id`, `degree_name`, `dept_id`) VALUES
(1, 'BSc (Honours) in Data Science - (UGC Approved - Offered By N', 1),
(2, 'BSc (Hons) Computer Networks - (Plymouth University - United', 2);

-- --------------------------------------------------------

--
-- Table structure for table `degree_offerer`
--

CREATE TABLE `degree_offerer` (
  `offerer_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `university` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `degree_offerer`
--

INSERT INTO `degree_offerer` (`offerer_id`, `name`, `university`, `country`) VALUES
(1, 'Plymouth', 'University of Plymouth', 'United Kingdom'),
(2, 'VU', 'Victoria University', 'Australia'),
(3, 'UGC', 'NSBM', 'Sri Lanka');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(60) NOT NULL,
  `dept_head` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_head`) VALUES
(1, 'Department of Data Science', 'Mr. Pramudya Thilakarathne'),
(2, 'Department of Network and Security', 'Mr. Chamindra Attanayake');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `module_no` int(11) NOT NULL,
  `module_code` varchar(60) NOT NULL DEFAULT 'no-code',
  `module_name` varchar(60) NOT NULL,
  `lecturer` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`module_no`, `module_code`, `module_name`, `lecturer`) VALUES
(1, 'PUSL2021', 'Computing Group Project', 'Pramudya Thilakarathne'),
(2, 'PUSL2026', 'Computer Networks', 'Chamindra Attanayake');

-- --------------------------------------------------------

--
-- Table structure for table `module_degree`
--

CREATE TABLE `module_degree` (
  `m_id` int(11) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `module_no` int(11) NOT NULL,
  `sem_year` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module_degree`
--

INSERT INTO `module_degree` (`m_id`, `degree_id`, `module_no`, `sem_year`) VALUES
(1, 1, 1, 'Y2'),
(2, 1, 2, 'Y2S2');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `staff_id` int(11) NOT NULL,
  `position` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `problem`
--

CREATE TABLE `problem` (
  `p_id` int(11) NOT NULL,
  `problem` varchar(1000) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `problem`
--

INSERT INTO `problem` (`p_id`, `problem`, `student_id`, `status`) VALUES
(1, 'Office account got locked', 21939, 'nw'),
(2, 'Exam results not received', 22345, 'nw');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(600) NOT NULL,
  `email` varchar(60) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `batch_number` decimal(3,1) NOT NULL,
  `degree_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`, `address`, `email`, `mobile`, `batch_number`, `degree_id`, `dept_id`) VALUES
(21939, 'DLS Anupama', '2/8, Opathella road, Uduthuthiripitiya', 'dlsanupama@students.nsbm.ac.lk', '0703727927', '21.1', 2, 2),
(22345, 'MA Perera', 'Henegama, Mannar', 'saniduanupama12@gmail.com', '0745623457', '21.2', 1, 1),
(22645, 'RANT Ranasingha', 'Ballapana,Divulapitiya', 'rantranasingha@students.nsbm.ac.lk', '0772356728', '21.1', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `template_message`
--

CREATE TABLE `template_message` (
  `t_id` int(11) NOT NULL,
  `template_name` varchar(300) NOT NULL,
  `message` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `template_message`
--

INSERT INTO `template_message` (`t_id`, `template_name`, `message`) VALUES
(1, 'A module missing in Nlearn', 'I\'m glad to inform you that the issue regarding the missing modules in Nlearn  has been fixed. You should now be able to access all the necessary modules without any problems.\r\nPlease let us know if you encounter any further issues or if you have any questions.\r\nThank you for bringing this to our attention and for your patience while we worked to resolve the issue'),
(2, 'Can’t access Nlearn', 'Thank you for reaching out to us. We are pleased to inform you that the issue with accessing Nlearn  has been resolved. You should now be able to access it without any problems.\r\nIf you encounter any further issues or have any questions, please don\'t hesitate to let us know.\r\nThank you for your patience and understanding.'),
(3, 'Can’t access DLE', 'Thank you for reaching out to us. We are pleased to inform you that the issue with accessing DLE  has been resolved. You should now be able to access it without any problems.\r\nIf you encounter any further issues or have any questions, please don\'t hesitate to let us know.\r\nThank you for your patience and understanding\r\n'),
(4, 'Can’t connect to the Wi-Fi network', 'Thank you for reaching out to us regarding your issue with connecting to the Wi-Fi network. After reviewing your concern, it appears that the issue might be on your side. We recommend that you try some troubleshooting steps such as resetting your Wi-Fi router or checking the network settings on your device.\r\n However, if the issue persists, we would suggest meeting our technical team who can assist you further with the issue.\r\n Please let us know if you require any further assistance or would like to schedule an appointment with our technical team.'),
(5, 'Won’t receive emails.', 'Following up on the issue you reported regarding not receiving emails, I wanted to inform you that our team has taken the necessary steps to fix the issue.\r\nCould you please check your email now and let us know if you are still experiencing the same problem? We want to ensure that everything is working as expected and that you are receiving all important communications.\r\nPlease do not hesitate to reach out to us if you have any further concerns or questions. We are always here to assist you.\r\nThank you for your patience and understanding.'),
(6, 'Exam results not received', 'Thank you for reaching out to us regarding the issue of not receiving your exam results. We apologize for any inconvenience this may have caused.\r\nAfter reviewing our records, we have resent the email containing your exam results to the email address on file. We kindly suggest that you check your email inbox, spam folder, and other email filters to ensure that you have received the email.\r\nIf you have still not received the email, please let us know and we will investigate the matter further to ensure that you receive your exam results promptly.\r\nThank you for your patience and understanding.'),
(7, 'Cannot log into microsoft account', 'Thank you for reaching out to us regarding the issue with logging into your Microsoft account. We are glad to inform you that we have fixed the issue and you should now be able to log in without any problems.\r\nWe recommend that you try logging into your Microsoft account again to confirm that the issue has been resolved. If you encounter any further issues, please do not hesitate to contact us again.\r\nThank you for your patience and understanding in this matter.'),
(8, 'Office account got locked', 'I am writing in response to your recent inquiry regarding the issue of your Office account being locked. I am pleased to inform you that we have taken immediate action to resolve this matter, and your account has been unlocked.\r\nTo verify that your account is now accessible, please log in to your Microsoft account and check the status of your Office subscription. You should now be able to access all of the features and services associated with your Office account.\r\n If you have any further questions or concerns, please do not hesitate to contact us. We are always here to assist you with any issues related to your Office account.'),
(9, 'Forgot the passwords of the Nlearn', 'Thank you for contacting us regarding the issue of forgetting your Nlearn password. In order to resolve this matter, we require you to prove your identity to ensure the security of your account. To do this, we kindly request that you meet with a member of our technical team in person.\r\nOur team members will assist you in resetting your password and securing your account. We apologize for any inconvenience this may cause, but we take the security of our users\' accounts very seriously.\r\nWe appreciate your cooperation in this matter.'),
(10, 'Forgot the passwords of the DLE', 'Thank you for reaching out regarding the issue of forgetting the passwords of the DLE.\r\nOne solution to this issue is resetting your password yourself. However, if you are still unable to resolve the issue or require further assistance, please let us know, and one of our technical team member who can guide you through the process.\r\nPlease feel free to contact us if you have any further questions or concerns.'),
(11, 'Forgot microsoft account password', 'Regarding the issue of forgetting your Microsoft account password. \r\nWe recommend resetting your password yourself, which is a quick and easy process. To do so, please follow these steps:\r\nGo to the Microsoft sign-in page and click on \"Forgot my password.\"\r\nEnter the email address or phone number associated with your account and follow the instructions on the screen.\r\nMicrosoft will send you a security code that you can use to reset your password.\r\nEnter the security code and create a new password.\r\nIf you have any difficulty resetting your password, please let us know and we can arrange for a technical team member to assist you further.'),
(12, 'Attendance cannot be marked', 'Regarding the issue with attendance marking. I understand that you are unable to mark attendance and require assistance to resolve the issue.\r\nIn order to address this issue, I suggest you meet with a technical team member who can provide you with the necessary support and guidance to resolve the issue. They will be able to analyze the issue in more detail and offer a tailored solution to get you back on track.\r\nThank you for your patience and cooperation. We look forward to resolving this issue as soon as possible.'),
(13, 'Payment was made but the account is still not activated', 'Thank you for bringing to our attention the issue regarding the activation of your account. We understand that you have made the payment, but your account is still not activated.\r\nWe apologize for any inconvenience caused and we assure you that we are working to resolve the issue as soon as possible.\r\nThank you for your patience and understanding. If you have any further questions or concerns, please don\'t hesitate to reach out to us.'),
(14, 'Wifi signal problems', 'Thank you for bringing to our attention the issue with the WiFi signal.\r\nAs per your concern, we will investigate the connection issues with the WiFi signal. It\'s possible that the problem may be due to the large number of people using the WiFi network, which can cause congestion and slow down the connection. \r\nWe will look into this matter and take the necessary steps to ensure that you have a better experience with our WiFi network. In the meantime, please bear with us as we work towards resolving this issue.\r\nThank you for your patience and understanding.');

-- --------------------------------------------------------

--
-- Table structure for table `time_table`
--

CREATE TABLE `time_table` (
  `timetable_id` int(11) NOT NULL,
  `batch_number` decimal(3,1) NOT NULL,
  `degree_offerer` varchar(60) NOT NULL,
  `timetable_link` varchar(6000) NOT NULL,
  `year_sem` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_table`
--

INSERT INTO `time_table` (`timetable_id`, `batch_number`, `degree_offerer`, `timetable_link`, `year_sem`) VALUES
(1, '21.1', 'Plymouth', 'https://nsbm365.sharepoint.com/:x:/r/SOC/_layouts/15/Doc.aspx?sourcedoc=%7BEB8CFDE9-4CAD-4984-84AF-F28813BB38BF%7D&file=Plymouth%20Semester%20II%20Time%20Table%202022%2C2023.xlsx&action=default&mobileredirect=true&DefaultItemOpen=1&login_hint=dlsanupama%40students.nsbm.ac.lk&ct=1680800592902&wdOrigin=OFFICECOM-WEB.MAIN.REC&cid=0af23c71-2dbc-4620-9924-2998b15a4d9f', 'Y2S2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_staff`
--
ALTER TABLE `academic_staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `active_batches`
--
ALTER TABLE `active_batches`
  ADD PRIMARY KEY (`batch_number`);

--
-- Indexes for table `admin_account`
--
ALTER TABLE `admin_account`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `daily_hall_allocation`
--
ALTER TABLE `daily_hall_allocation`
  ADD PRIMARY KEY (`day`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`degree_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `degree_offerer`
--
ALTER TABLE `degree_offerer`
  ADD PRIMARY KEY (`offerer_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`module_no`);

--
-- Indexes for table `module_degree`
--
ALTER TABLE `module_degree`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `degree_id` (`degree_id`),
  ADD KEY `module_no` (`module_no`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `problem`
--
ALTER TABLE `problem`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `batch_number` (`batch_number`),
  ADD KEY `degree_id` (`degree_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `template_message`
--
ALTER TABLE `template_message`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `time_table`
--
ALTER TABLE `time_table`
  ADD PRIMARY KEY (`timetable_id`),
  ADD KEY `batch_number` (`batch_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_staff`
--
ALTER TABLE `academic_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_account`
--
ALTER TABLE `admin_account`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `degree`
--
ALTER TABLE `degree`
  MODIFY `degree_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `degree_offerer`
--
ALTER TABLE `degree_offerer`
  MODIFY `offerer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `module_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_degree`
--
ALTER TABLE `module_degree`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `problem`
--
ALTER TABLE `problem`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `template_message`
--
ALTER TABLE `template_message`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `time_table`
--
ALTER TABLE `time_table`
  MODIFY `timetable_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_staff`
--
ALTER TABLE `academic_staff`
  ADD CONSTRAINT `academic_staff_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `degree`
--
ALTER TABLE `degree`
  ADD CONSTRAINT `degree_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `module_degree`
--
ALTER TABLE `module_degree`
  ADD CONSTRAINT `module_degree_ibfk_1` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`degree_id`),
  ADD CONSTRAINT `module_degree_ibfk_2` FOREIGN KEY (`module_no`) REFERENCES `modules` (`module_no`);

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `academic_staff` (`staff_id`);

--
-- Constraints for table `problem`
--
ALTER TABLE `problem`
  ADD CONSTRAINT `problem_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`batch_number`) REFERENCES `active_batches` (`batch_number`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`degree_id`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `time_table`
--
ALTER TABLE `time_table`
  ADD CONSTRAINT `time_table_ibfk_1` FOREIGN KEY (`batch_number`) REFERENCES `active_batches` (`batch_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
