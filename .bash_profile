if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

accounts_file=/s/GLOPS/Data\ Governance/Finance\ Data\ Governance\ Compendium\ \(current\)/GL\ Chart\ of\ Account\ Change\ Log\ Report/Prep\ Output/SEC\ Accounts.csv

function accounts { grep "$1" "$accounts_file" --color;}

gl_changes=/s/GLOPS/Data\ Governance/Finance\ Data\ Governance\ Compendium\ \(current\)/GL\ Chart\ of\ Account\ Change\ Log\ Report/Archived\ Change\ Logs/csvs

function gl_changes { grep -R "$1" "$gl_changes" --color;}
export PATH=/usr/local/bin:/Users/dponce1/.nvm/versions/node/v14.18.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/dponce1/.nvm/versions/node/v14.18.3/bin
