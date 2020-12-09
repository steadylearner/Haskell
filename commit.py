# Make Haskell version of this.

# https://www.steadylearner.com/blog/read/How-to-automatically-commit-files-to-GitHub-with-Python

import subprocess as cmd

cp = cmd.run("git add .", check=True, shell=True)

response = input("Do you want to use the default message for this commit?([y]/n)\n")

default = "Edit README.md"

if response.startswith('n'):
    message = input("What message you want?\n")
    # Use deafult_message when user mistakenly use enter here.
    # When your intention is to automate, it will be no problem with reset_commit.py
    # Use while with input prompt if you want to complicate this.
    if not message:
        message = default
else:
    message = default

cp = cmd.run(f"git commit -m '{message}'", check=True, shell=True)
cp = cmd.run("git push -u origin main -f", check=True, shell=True)

# -- if "n" `isPrefixOf` response
# --     then 
# --         let message = promptLine "What message do you want then?\n"
# --     else 
# --         let message = promptLine "What message do you want then?\n"
# --     -- callCommand commit ++ deafultMessage
    

#     -- if num < 0
#     --         then show num ++ " is negative."
#     --         else if num < 10
#     --             then show num ++ " has 1 digit."
#     --             else show num ++ " has more than 1 digit."
    
#     -- then do
#     --     message <- promptLine "What message do you want then?\n"
#     --     if message == ""
#     --         then callCommand commit ++ deafultMessage
#     --         else callCommand commit ++ message

#     --     callCommand "git push -u origin main -f"

#     -- else callCommand commit ++ deafultMessage

# -- callCommand "git push -u origin main -f"
