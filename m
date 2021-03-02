Return-Path: <SRS0=3rOi=IA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=U14NRQaQjBPG5YvFiLvOjmH1u3RNPGuSGDEXPqOdusA=;
        b=tHJQQoPXRNW2xw2iOBKrxZSLm25fl7XTJfNGjNiPZ2vKkXoDzK11A8y9O/jyuPEfyx
         Lg3C5bnQJpDwpln0h+3aPh5QFGVB7CUjRbXfnBiGtkVNutwTr4b9VoZk1aG0UipuwVQF
         79uDDL7Xih9S1Ln370JbMGb1CTEq4e0HhEKZ2/0/NqVnbnMjW1Yik2hQ2hNShBdvQLBu
         lgyS03pDfDkV3lEpKvfjOvHaRyfpqWrpDVmJ54j+GK2K9TFAOfcpG1GDpvjCA0F462Ks
         7ZNTJtk4JO28iFRMljrJ35s6+ly3O8oAylIzYyEKbKBF+5vZcNEPZa6dw6ClUomlktv7
         lArQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL -perfbook] Bibliography and misc updates, take two
Message-ID: <c8254363-b8c0-3e45-1bf0-e41be7af64d6@gmail.com>
Date: Tue, 2 Mar 2021 23:50:36 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

This pull request consists of followup url updates in bibliography
and elsewhere.

This time around, I managed to explain non-obvious changes in the
commit logs.
Most changes just substitute "https:" for "http:" in URLs.
Other changes are mentioned in each commit log.

I'm certain there still remain some breakages I'm missing.  Papers with
DOIs are safe, but "unpublished" entries need periodic health checks.

        Thanks, Akira

---
The following changes since commit 163fc536dc0fe6a4d9aa8c61b030ba94ea401d1c:

  easy: Updates and wordsmithing (2021-03-01 18:09:41 -0800)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2021.03.02a

for you to fetch changes up to 7c2c33a896ede1bb9ce476b8a67451c3fb364203:

  treewide: url related updates, take two (2021-03-02 23:23:44 +0900)

----------------------------------------------------------------
Akira Yokosawa (4):
      whymb: Fix potential extra blank line within 'sequence' list
      alphapf.bst: Use 'https:' as base of doi, eprint, and pubmed URLs
      bib: url updates take two
      treewide: url related updates, take two

 alphapf.bst                          |   6 +-
 appendix/styleguide/styleguide.tex   |   2 +-
 appendix/whymb/whymemorybarriers.tex |   2 +-
 bib/OSS.bib                          |  12 +--
 bib/RCU.bib                          | 169 ++++++++++++++++++-----------------
 bib/TM.bib                           |  34 ++++---
 bib/WFS.bib                          |   2 +-
 bib/hw.bib                           |  28 +++---
 bib/maze.bib                         |   5 +-
 bib/os.bib                           |  28 +++---
 bib/parallelsys.bib                  |  23 +++--
 bib/realtime.bib                     |  46 +++++-----
 bib/refs.bib                         |   1 -
 bib/swtools.bib                      |  44 ++++-----
 bib/syncrefs.bib                     |  47 +++++-----
 datastruct/datastruct.tex            |   2 +-
 formal/formal.tex                    |   2 +-
 formal/ppcmem.tex                    |   6 +-
 formal/spinhint.tex                  |   4 +-
 howto/howto.tex                      |   6 +-
 intro/intro.tex                      |   2 +-
 legal.tex                            |   4 +-
 locking/locking.tex                  |   2 +-
 23 files changed, 246 insertions(+), 231 deletions(-)
