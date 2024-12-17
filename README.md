![Simulator Screen Recording - iPhone 16 Pro - 2024-12-17 at 13 11 02](https://github.com/user-attachments/assets/3a970948-560d-4956-a6ad-37bb26474751)

# **Notepad with Todo App**

## **Overview**

The **Notepad with Todo App** is a feature-rich iOS application built using **Swift**. It allows users to create, manage, and organize notes and tasks efficiently. The app combines a **Notepad** for general note-taking and a **Todo List** for task management, providing users with a seamless and intuitive experience.

---

## **Features**

### **1. Notepad**
- **Create Notes**: Add new notes with a title and description.  
- **Edit Notes**: Update the content of existing notes.  
- **Delete Notes**: Remove notes that are no longer needed.  
- **CRUD Operations**: Fully functional Create, Read, Update, and Delete operations.  
- **Search & Filter**:  
   - Search notes by **title**.  
   - Filter notes based on **date** or **keywords**.  
- **Private & Personal Notes**:  
   - Option to mark notes as **private** or **personal**.  
   - Private notes are secured and not visible in the general list.  

### **2. Todo List**
- **Add Todos**: Create new tasks to keep track of daily activities.  
- **Mark as Completed**: Select tasks to mark them as completed.  
- **Remove Completed Tasks**: Unmark or delete completed tasks.  
- **Search Todos**:  
   - Search tasks using a keyword.  
- **Reorder Tasks**:  
   - Drag and drop tasks to reorder priorities.  
- **Persistent Storage**:  
   - Todos and their completed state are stored locally using **UserDefaults**.  
- **Search & Filter**:  
   - Search for specific tasks using keywords.  
   - Filter tasks based on their completion status.  

---

## **Technologies Used**

- **Swift**: Core programming language for the app.  
- **UIKit**: For building the user interface.  
- **UserDefaults**: For local data persistence of todos and notes.  
- **MVVM Design Pattern**: Ensures clean code separation between the View, ViewModel, and Model.  

---

## **Architecture**

The app is structured using the **MVVM** (Model-View-ViewModel) design pattern:

1. **Model**:  
   Represents the data structure (e.g., `Todo` model with `title` and `isCompleted` properties).  

2. **View**:  
   Handles UI components like `UITableView`, `UISearchBar`, and other visual elements.  

3. **ViewModel**:  
   Contains the app logic, such as managing todos, filtering data, and saving/loading to UserDefaults.  

---

## **How to Run the App**

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/Notepad-Todo-App.git
   ```

2. **Open in Xcode**:  
   - Open the project in **Xcode**.  

3. **Run on Simulator or Device**:  
   - Select a target device/simulator and press **Run** (`Cmd + R`).  

---

## **Usage**

### **Notepad**:
1. Tap the **+** button to add a new note.  
2. Enter the **title** and **description** of the note.  
3. Use the search bar to find notes quickly.  
4. Edit or delete notes by swiping left on the list.  

### **Todo List**:
1. Tap the **+** button to add a new task.  
2. Tap a task to **mark it as completed**.  
3. Swipe left to **delete** a task.  
4. Use the search bar to filter tasks by keywords.  

---

## **Future Enhancements**

- **Dark Mode**: Add support for dark mode.  
- **Cloud Sync**: Sync notes and tasks across devices using iCloud.  
- **Notifications**: Add reminders for tasks.  
- **Categories**: Organize notes and tasks into categories.  

---

### **Enjoy managing your notes and tasks efficiently! 🚀**

---
