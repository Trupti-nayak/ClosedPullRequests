# GitHubPullRequestsDemo

This iOS App displays all the closed pull requests for my user.

If the Api is a success a list of closed PR are shown to the user
If the Api fails a toast message is shown to the user
This app is designed using Clean swift and PoP, keeping scalability in mind.
An effort is made to keep the UI and business logic seperate and use extensions whereve possible


Extension:
This app can be extended to be more generic by providing a User Interface for the user to give the user details and repo name to show the UI

Improvements:
- Make the cellForRowAt indexPath be generic and accept more than one cell by configuring the viewmodel for each of the cells and presenter is responsible for configuring them
- Download of images should use a URLSession downloadTask and down the file and save it to the document directory or core data
- User interface experience 
