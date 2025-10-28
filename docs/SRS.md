# Huroof (حروف)

## Arabic Language Learning Platform (Pronunciation Focus)

### Software Requirements Specification

---

## 1.0 Introduction

### 1.1 Purpose

This document specifies the software requirements for **Huroof**, an Arabic language learning platform focused on pronunciation training using AI-based feedback via the **Whisper model**. The system allows users to practice pronouncing **short vowel forms of Arabic letters** (e.g., **با، بو، بي**) and receives **binary feedback** (Correct / Try Again). This logic applies uniformly across all Arabic base letters.

---

## 2.0 Overall Description

### 2.1 Product Perspective

Huroof is a standalone application that provides pronunciation training for Arabic learners. It focuses only on basic letter sounds with short vowels (e.g., **با، بو، بي**) and supports **any Arabic letter** in this format. It integrates with the **Whisper ASR model** for voice analysis and returns a binary result indicating whether the user's pronunciation was accurate.

---

## 2.2 Product Functions

| Function | Description |
| --- | --- |
| Letter Selection | User selects one of the target letter-vowel combinations (e.g., **با، بو، بي**) from any Arabic letter group (e.g., ب، ت، ث، ج...) |
| Audio Playback | Plays pre-recorded audio of the correct pronunciation of the selected letter-vowel combination. |
| Voice Recording | Allows user to record their pronunciation attempt. |
| Pronunciation Analysis | Uses Whisper ASR to compare user’s recording with the reference audio. |
| Feedback Display | Displays binary feedback: "Correct" or "Try Again". |
| Repeat Practice | User can re-record and re-analyze as many times as desired. |

---

## 2.3 User Classes and Characteristics

| User Class | Description |
| --- | --- |
| Learner | A beginner-level Arabic learner practicing pronunciation. |

---

## 2.4 Operating Environment

| Component | Specification |
| --- | --- |
| Frontend | Flutter (for mobile) |
| Backend | FastAPI RESTful API |
| AI Model | Whisper ASR (OpenAI) |
| UI Design | Figma |
| Supported Devices | Android, iOS |

---

## 2.5 Design and Implementation Constraints

| Constraint | Description |
| --- | --- |
| Input Format | Users speak into a microphone |
| Output Format | Binary feedback: Correct / Try Again |
| Audio Source | Pre-recorded human audio files |
| AI Integration | Use Whisper ASR only for pronunciation comparison |
| Data Storage | Optional local storage of user session data for progress tracking |
| Permissions | Microphone access must be granted by the user |
| Usability | Designed for non-technical users with minimal instructions needed |

---

## 2.6 User Documentation

| Document Type | Description |
| --- | --- |
| User Manual | Simple guide explaining how to use the app |
| Online Help | In-app tooltips and help sections |
| Technical Docs | API documentation and deployment guides |

---

## 2.7 Assumptions and Dependencies

| Assumption | Description |
| --- | --- |
| Internet Access | Required for Whisper integration |
| Microphone Availability | Device must have a working microphone |
| Audio Files | All reference audio files are available and correctly labeled |
| Whisper API Availability | OpenAI Whisper service is accessible during usage |
| User Cooperation | User speaks clearly and follows prompt instructions |

---

## 3.0 External Interface Requirements

### 3.1 User Interfaces

| Interface | Description |
| --- | --- |
| Mobile App | Main interface for learners (Flutter-based) |

---

## 4.0 Non-Functional Requirements

| Requirement | Description |
| --- | --- |
| Accuracy | Whisper must provide at least 90% accuracy for known speakers |
| Response Time | Feedback should be shown within 5 seconds after submission |
| Security | No sensitive data collected; optional encryption if storing recordings |
| Usability | Minimal UI with large buttons and clear prompts |

---

## 5.0 Use Case Specification and Diagram

---

### UC-01: Letter Selection

| Field | Description |
| --- | --- |
| Use Case ID | UC-01 |
| Name | Letter Selection |
| Actor | Learner |
| Priority | High |
| Description | Learner selects a letter-vowel combination (e.g., **با، بو، بي**) from any Arabic letter group |
| Preconditions | Application is loaded and audio files are available |
| Postconditions | Selected letter-vowel is displayed and ready for playback/recording |
| Normal Flow | 1. User opens the app
2. List of letter-vowel options appears
3. User taps a letter(e.g., **ب**)
4. Screen loads with audio and recording option |
| Assumptions | Options are predefined and static |

---

### UC-02: Audio Playback

| Field | Description |
| --- | --- |
| Use Case ID | UC-02 |
| Name | Audio Playback |
| Actor | Learner |
| Priority | High |
| Description | Learner listens to the correct pronunciation |
| Preconditions | Letter-vowel is selected |
| Postconditions | Audio is played successfully |
| Normal Flow | 1. User clicks “Play”
2. Audio plays through device speakers |
| Alternative Flow | Audio fails to load → show error |
| Exceptions | Audio file missing or corrupted |
| Assumptions | Audio files are pre-recorded and stored locally |

---

### UC-03: Voice Recording

| Field | Description |
| --- | --- |
| Use Case ID | UC-03 |
| Name | Voice Recording |
| Actor | Learner |
| Priority | High |
| Description | Learner records their pronunciation |
| Preconditions | Microphone permission is granted |
| Postconditions | Audio is recorded and saved temporarily |
| Normal Flow | 1. User clicks “Record”
2. Recording starts
3. User speaks
4. Recording stops automatically or manually |
| Alternative Flow | User cancels before completion |
| Exceptions | Microphone not available |
| Assumptions | User speaks clearly and within time limit |

---

### UC-04: Pronunciation Analysis

| Field | Description |
| --- | --- |
| Use Case ID | UC-04 |
| Name | Pronunciation Analysis |
| Actor | AI Engine (Whisper) |
| Priority | High |
| Description | Analyze user’s pronunciation against reference |
| Preconditions | User has completed a recording |
| Postconditions | Result is generated and returned |
| Normal Flow | 1. System sends audio to Whisper
2. Comparison is made
3. Binary result is returned |
| Alternative Flow | Whisper returns low confidence or invalid input |
| Exceptions | Whisper API unavailable |
| Assumptions | Whisper model is trained on Arabic phonetics |

---

### UC-05: Feedback Display

| Field | Description |
| --- | --- |
| Use Case ID | UC-05 |
| Name | Feedback Display |
| Actor | Learner |
| Priority | High |
| Description | Show result of pronunciation analysis |
| Preconditions | Analysis has completed |
| Postconditions | User sees visual + text feedback |
| Normal Flow | 1. System displays result
2. Option to replay correct audio |
| Alternative Flow | No feedback received → show error |
| Exceptions | Network timeout |
| Assumptions | Feedback is simple and actionable |

---

### UC-06: Repeat Practice

| Field | Description |
| --- | --- |
| Use Case ID | UC-06 |
| Name | Repeat Practice |
| Actor | Learner |
| Priority | Medium |
| Description | Allow user to re-record and re-analyze |
| Preconditions | At least one round of feedback has been given |
| Postconditions | User can try again |
| Normal Flow | 1. User clicks “Try Again”
2. Reset current session
3. Re-record and re-submit |
| Alternative Flow | User chooses another letter instead |
| Assumptions | User wants to improve based on feedback |

---

## **1. Use Case Diagram Description**

### **🧍‍♂️ Actors:**

- **Learner**

### **📦 System Boundary:**

- Huroof - Arabic Pronunciation Learning Platform

### **📌 Use Cases:**

- UC-01: User Selects Level
- UC-02: User Selects Letter to Learn
- UC-03: Letter Lesson (Shape, Sound, Spelling)

### **🖼 Visual Layout:**

```jsx
+----------------------------------------------------------------+
|                حروف - منصة تعلم النطق العربية                |
|                                                                |
| [UC-01] اختيار الحرف                                          |
| [UC-02] تشغيل الصوت                                           |
| [UC-03] تسجيل الصوت                                           |
| [UC-05] عرض التغذية الراجعة                                   |
| [UC-06] إعادة المحاولة                 [UC-04] تحليل النطق   |
+----------------------------------------------------------------+
           ^                                        ^
           |                                        |
    +--------------+               +---------------------------------+
    |   المتعلم    |              |  محرك الذكاء الاصطناعي (ويسبر) |
    +--------------+               +---------------------------------+
```

---

## **🔹 2. Activity Diagrams**

---

### **🔄 UC-01: User Selects Level**

```jsx
[Start]
   ↓
[Display Level Options: Beginner, Intermediate, Advanced]
   ↓
[Learner selects "Beginner"]
   ↓
[System proceeds to Letter Selection Screen]
   ↓
[End
```

---

### **🔄 UC-02: User Selects Letter to Learn**

```jsx
[Start]
   ↓
[Show list of Arabic letters (e.g., ب، ت، ث...)]
   ↓
[Learner selects a letter (e.g., ب)]
   ↓
[System displays short vowel forms (با، بو، بي)]
   ↓
[Learner selects one variation (e.g., بي)]
   ↓
[System loads lesson screen for selected letter-vowel]
   ↓
[End]
```

---

### **🔄 UC-03: Letter Lesson (Shape, Sound, Spelling)**

```jsx
[Start]
   ↓
[Show isolated form of the letter]
   ↓
[Show letter in different positions (initial, medial, final)]
   ↓
[Play pre-recorded audio pronunciation]
   ↓
[Display spelling variants (e.g., با، بو، بي)]
   ↓
[Learner listens to each variant]
   ↓
[Learner attempts pronunciation]
   ↓
[Learner records voice attempt]
   ↓
[System sends recording to Whisper ASR]
   ↓
[Whisper analyzes and compares with reference audio]
   ↓
[Binary feedback shown: "Correct" / "Try Again"]
   ↓
[Learner chooses: Repeat practice or Exit]
   ↓
[End]
```

---

## **🔹 3. Sequence Diagram (Core Feature – UC-03: Letter Lesson)**

This sequence diagram shows interaction between:

- **User**
- **UI (Frontend)**
- **Backend (API)**
- **AI Model (Whisper)**
- **Database (Optional)**

### **📐 Interaction Flow:**

```jsx
User                → UI: Clicks on a letter (e.g., بي)
UI                  → Backend: Request lesson data
Backend             → Database: Retrieve letter info (shape, sound, variants)
Database            → Backend: Return data
Backend             → UI: Send lesson content
UI                  → User: Display shape, sound, variants
User                → UI: Clicks record
UI                  → User: Prompt to speak
User                → UI: Speaks and submits audio
UI                  → Backend: Send recorded audio
Backend             → Whisper: Analyze pronunciation
Whisper             → Backend: Return result ("Correct"/"Try Again")
Backend             → UI: Send feedback
UI                  → User: Show feedback
User                → UI: Choose to repeat or exit
```

---

