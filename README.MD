<div align="center">
  <a href="https://github.com/thecreazy/fygs">
    <img src="https://github.com/thecreazy/FYGS/blob/main/docs/logo.png" alt="Icon" width="500"/>
  </a>
  <br>
  <br>
</div>

# FYGS [Fuck your git stats]

Have you always dreamed of having github stats like these but don't have time?

<div align="center">
  <a href="https://github.com/thecreazy/fygs">
    <img src="https://github.com/thecreazy/FYGS/blob/main/docs/wannabe.png" alt="Wannabe" width="500"/>
  </a>
  <br>
  <br>
</div>

It's time to pump your stats with FYGS!

## 🚀 Features

- ⭐️ Commit file by file your changed / addition / deletions
- 🧐 Force push on your repo
- ✅ Rewrite yout github stats history creating commit in the past

## 🔌 Installation

Clone the repo and
```bash
make install
```

This repo needs `unix date` so please install `gdate` if you use MacOS, the code will auto try to install gdate using `brew` but, of course, is better if you choose how and where install it.

## 🪄 Using

```bash
Usage: fygs -m"feat(core): My nice feature" [-p] [-f]
         -m'My nice feature' -> base commit message
         -v -> return the version
         -p -> push after the commit
         -f -> create last year fake empty commits in your repo
```

<table>
  <thead>
    <tr>
      <th>Flag</th>
      <th>What do</th>
      <th>Default</th>
      <th>Mandatory</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>-v</td>
      <td>Return the version of FYGS</td>
      <td>-</td>
      <td>false</td>
    </tr>
     <tr>
      <td>-m""</td>
      <td>Set the commit message</td>
      <td>""</td>
      <td>true</td>
    </tr>
    <tr>
      <td>-p</td>
      <td>Force push on the default branch</td>
      <td>false</td>
      <td>false</td>
    </tr>
    <tr>
      <td>-f</td>
      <td>Create fake empty commit in the past 365 days</td>
      <td>false</td>
      <td>false</td>
    </tr>

  </tbody>
</table>

> Examples

1. Normal Commit example 

<div align="left">
  <a href="https://github.com/thecreazy/fygs">
    <img src="https://github.com/thecreazy/FYGS/blob/main/docs/example_normal.png" alt="Example normal" width="500"/>
  </a>
  <br>
  <br>
</div>

2. Commit and push example 

<div align="left">
  <a href="https://github.com/thecreazy/fygs">
    <img src="https://github.com/thecreazy/FYGS/blob/main/docs/example_push.png" alt="Example with push" width="500"/>
  </a>
  <br>
  <br>
</div>

3. Normal Commit example 

<div align="left">
  <a href="https://github.com/thecreazy/fygs">
    <img src="https://github.com/thecreazy/FYGS/blob/main/docs/example_fake.png" alt="Example fake" width="500"/>
  </a>
  <br>
  <br>
</div>

## 🤝 Contributing

1. Fork this repository
2. Create your branch: git checkout -b `feat/mynicefeat` or `fix/mynicefix`
3. Commit your changes: git commit -m `'feat|fix(core|docs):Add some feature'`
4. Push to the branch: git push origin `feat/mynicefeat`

After your pull request is merged, you can safely delete your branch.

# 📝 License

This project is licensed under the DWTFYW License - see the LICENSE.MD file for more information.