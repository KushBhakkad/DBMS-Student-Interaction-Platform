# DBMS-Student-Interaction-Platform

The **Student Interaction Platform** is a comprehensive database management system designed to foster collaboration, knowledge sharing, and interaction among students. This project allows students to ask questions, share expertise, provide answers, and review the quality of responses. It organizes information about students, their areas of expertise, questions, answers, and reviews within a structured relational database.

**Project Overview**

This platform is built to enable students to interact through Q&A-style discussions. Students can post questions, provide answers, review answers, and highlight their expertise in specific domains. The system also calculates average ratings for answers, ensuring a quality-driven knowledge-sharing experience.

**Features**

- **Student Profiles**: Store details like PRN, name, year, email, GitHub, LinkedIn, and bio.  
- **Domain Expertise**: Highlight the areas of expertise for each student.  
- **Q&A System**: Post questions, provide answers, and review them.  
- **Real-time Triggers**: Automatically update average ratings for answers.  
- **Procedures**: Facilitate database operations like inserting and querying records.  

**Database Structure**

The database consists of the following tables:

1. **students**: Stores student details.  
2. **domains**: Lists various areas of expertise.  
3. **expertise**: Links students to their respective areas of expertise.  
4. **questions**: Contains questions posted by students.  
5. **answers**: Contains answers to the questions, with average ratings.  
6. **reviews**: Stores ratings and comments for answers.

**Entity-Relationship Diagram**

![ER_Diagram](https://github.com/user-attachments/assets/9f60ae08-5c9b-44a7-9ce1-01683e175738)
