Steps to Release apk using GitHub Actions

STEP 1:- Create Repository

 a. Login to your Github account
 b. In the upper-right corner of any page, use the drop-down 
 
 c. Type a name for your repository, and an optional description.
 
 d. Choose a repository visibility
.  
 e. Click Create repository.
 

STEP 2:- Pull Flutter code from your local machine

a.	Open Git Bash.
b.	Change the current working directory to your local project.
c.	Initialize the local directory as a Git repository.
            $ git init -b main
d.	Add the files in your new local repository. This stages them for the first commit.
     $ git add .
e.	Commit the files that you've staged in your local repository.
     $ git commit -m "First commit"

f.	At the top of your repository on GitHub.com's Quick Setup page, click to copy the remote repository URL. 
g.	In the Command prompt add the URL for remote repository where your local repository will be pushed.
     $ git remote add origin  <REMOTE_URL> 
# Sets the new remote URL
     $ git remote -v
# Verifies the new remote URL

h.	Push the changes in your local repository to GitHub.com.
    $ git push origin main

Note: - Always compile your code on Local Machine first before using Git Action
STEP 3:- Use Git Action
a.	 Check all the files that you have pushed to your github account
b.	 Go to Actions tab 
 
GitHub Actions uses YAML syntax to define the workflow. Each workflow is stored as a separate YAML file in your code repository, in a directory called .github/workflows.
c.	Setup your workflow by clicking the highlighted link or choose a suggested workflow for your repository. 
d.	Check the YAML script and Click the “Commit” button. 



STEP 4:- View Workflow Activity

a.	Once your workflow has started running, you can see a visualization graph of the run's progress and view each step's activity on GitHub.
b.	On GitHub.com, navigate to the main page of the repository.
c.	Under your repository name, click Actions
. 
d.	In the left sidebar, click the workflow you want to see.
 
e.	Under "Workflow runs", click the name of the run you want to see 
f.	View the results of each step. 
g.	Find APK
  
 
  Where to find the apk?
  
1.	 Go to your Repository
2.	Click the Actions tab
3.	Select the desired workflow
4.	Click on successful workflow
5.	Towards bottom of the page-->artifacts/release-apk

NOETE : BELOW ARE SOME OF THE ERRORS FIXED WITH ANDROID APP OLD WORKFLOW


Error 1
Conflicting Outputs 
Description : 
Assume conflicting outputs in the users package are from previous builds, and skip the user prompt that would usually be provided.
ReSolution :
GoTo<workflow.yaml> -->Update Following Dependancies
# Get flutter dependencies.
    - run: flutter pub get
    - run: flutter packages pub run build_runner build --delete-conflicting-outputs
    - run: flutter pub run flutter_launcher_icons:main


Error 2 
Build Error
Description :-
When the packages providing Builders are configured with a build.yaml file they are designed to be consumed using an generated build script. Most builders should need little or no configuration, see the documentation provided with the Builder to decide whether the build needs to be customized. If it does you may also provide a build.yaml with the configuration. See the package:build_config README for more information on this file.
To have web code compiled to js add a dev_dependency on build_web_compilers.
ReSolution :
GoTo pubspec.yaml -->Update Build Runner
 


Error 3
Launcher Icon
Could not find package "flutter_launcher_icons". Did you forget to add a dependency?
https://github.com/fluttercommunity/flutter_launcher_icons/issues/147
Description :
A package which simplifies the task of updating your Flutter app's launcher icon.
ReSolution :
Goto<repository>-->pubspec.yaml
Update the Following Parameters
dev_dependencies:
  flutter_launcher_icons: "^0.8.1"
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/favicon.png"
 
 

Error 4
Analyzer 
ReSolution  :
Ignoring Analysers Due to bug
GoTo <repository> -->create analysis_options.yaml file
Put following Parameters In pubspec.yaml file
analyzer:
  errors:
    todo: ignore

 
 
Error 5 
Analyzer
'flutter analyze' exits with 1 even on 'info':
https://github.com/flutter/flutter/issues/20855
Description :

ReSolution :
GoTo <workflow>
Delete Flutter Analyzer due to bug
