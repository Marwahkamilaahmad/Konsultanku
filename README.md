# konsultanku
**Team :** DZIRION

**Member :**
1. Nikita Dinda Azizah (Hustler)
2. Yashinta Asa Imama ( Hipster )
3. Dzaki Maulana A ( Hacker )
4. Marwah Kamila Ahmad ( Hacker )

## REST API Documentation
- [Backend](https://github.com/Marwahkamilaahmad/Konsultanku/tree/main/server)
- [API Documentation](https://documenter.getpostman.com/view/30161030/2s9YsMBC4g)

## How Our MVP Works?
> "To run this application, we use MySQL in our MVP. In my development, I use Xampp to run MySQL and edit it in phpMyAdmin"
1. **MSE See All Solution from Student**
   - Flutter gets all data comments from (http://localhost:8080/api/v1/mse/comments).
   - Server sends data in JSON form to Flutter.

2. **Mse Send Offer**
   - Flutter hits the endpoint (http://localhost:8080/api/v1/send-offer/{id}) with the POST method.
   - Server makes a new row in table collaboration.

3. **Student Get Notification**
   - Flutter will serve some notifications for students who have joined a team through (http://localhost:8080/api/v1/team/offers).
   - Server will send JSON data with the name of MSE innit.

4. **Student Decisions**
   - Flutter will hit (http://localhost:8080/api/v1/team/decision) with the PUT method to update the row if they accept the offer.
   - If collaboration happens, the server will allow some rules.

## Screenshots App
1. Login Page
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_02.png" alt="Deskripsi Gambar" width="300" height="380">
2. Register Page
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_03.png" alt="Deskripsi Gambar" width="300" height="380">
3. Create Post for MSME
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_10.png" alt="Deskripsi Gambar" width="300" height="380">
4. Post Feeds from MSME
this post contains MSME problem ask for help
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_09.png" alt="Deskripsi Gambar" width="300" height="400">
5. Preview MSME's Post
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_11.png" alt="Deskripsi Gambar" width="300" height="400">
6. Student can give a comment to offer solutions
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_13.png" alt="Deskripsi Gambar" width="300" height="400">
7. MSME's collab with student
click collab text button on student's comment. Post's tag will change to "on progress task"
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_12.png" alt="Deskripsi Gambar" width="300" height="400">
8. Check MSME's Profile Activity
Shows MSME's activity for instance information MSME's collab with
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_07.png" alt="Deskripsi Gambar" width="300" height="400">
9. Chat Room
Only fellow collaborator could sent a message
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_08.png" alt="Deskripsi Gambar" width="300" height="400">
10. User Profile Identity
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_04.png" alt="Deskripsi Gambar" width="300" height="400">
11. User's post
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_05.png" alt="Deskripsi Gambar" width="300" height="400">
12. User's Preview Post
if post currently on going, post's tag will shows "on progress task"
<img src="https://raw.githubusercontent.com/Marwahkamilaahmad/Konsultanku/main/screenshot/flutter_06.png" alt="Deskripsi Gambar" width="300" height="400">




