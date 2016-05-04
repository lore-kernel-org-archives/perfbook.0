Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=O3b+xrRos126Dwiu8/IdCeEzdoRNjRjpDtDZIfEYdIc=;
 b=Avxz0Oo7lrD03YgMrzora09d7APv8YbgmH5iO/g1vGlR0bgcE7/u+qgXDnumwv26HC
 jj6sx82WLMZ7YoxXoD7LUqPlGWtPfFvA6e2NFzZsjk+4+xTCVpn15TbZ0dd+WARBBe3H
 ESmwZLjVd8dPpk/TWJjm4MyGjoFsZ25yMKYJ1elcD/NIn8cGf7Gq/3IwBoynmMdXJTS0
 hwJrFvYyI/+/m/0kzeTK9PuL5E7YmlhQrHpTiOubb/g7Ciw5c1qiQBbtXP+Vxj3AvYu+
 XXPu64B+D2aQDhrgOAl9Cx3mWWu0xFXZ3CEtQahkd29B5eif7oiBq+wl6RbalRXarjoj
 0Udg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [GIT PULL FOR TEST v2] Another round of build script tweaks
Message-ID: <3d253c44-5f0d-a809-119d-70f0ba38000e@gmail.com>
Date: Thu, 5 May 2016 00:39:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi, Paul.

Finally, I set up a GitHub account, and pushed v2 of the series
"Another round of build script tweaks".

Please pull this into your local test branch and take time to see if
it actually works as you would expect. I'm fairly certain there would
be some regression, especially in the final commit 92ae43c3a72a
("Further improvement of build scripts").
I'm also concerned about the fix of sig-theft.dot.

Changes from v1.
    Reorganized the entire series so that minor changes would come
    first.

Note: While I set up the account, I noticed a typo in my git-config
setting of user.email.  My email address in the commit messages so
far was wrong. Sorry for the slip-up...

                                                Thanks, Akira

---
The following changes since commit 3f8bb7d620edee44637be00ba738761a4fc0732e:

  .gitignore: Add planned empty targets (2016-05-03 17:49:50 -0700)

are available in the git repository at:

  https://github.com/akiyks/perfbook.git makefile-tweaks-v2

for you to fetch changes up to 92ae43c3a72a3bcd7fd99ac681209ceafc6d7e65:

  Further improvement of build scripts (2016-05-04 23:43:06 +0900)

----------------------------------------------------------------
Akira Yokosawa (7):
      Add font installation check
      Add short name targets in Makefile
      sig-theft: Fix .dot source for dot - graphviz version 2.36.0
      Make default target of "make" overridable
      Makefile: Reorder rules
      Makefile: Use wildcards
      Further improvement of build scripts

 .gitignore            |   1 -
 FAQ.txt               |  23 ++++
 Makefile              | 336 ++++++++++++++++++-------------------------------
 count/sig-theft.dot   |  17 +--
 count/sig-theft.eps   | 338 +++++++++++++++++++++++---------------------------
 utilities/eps2pdf.sh  |  12 ++
 utilities/runlatex.sh |   9 ++
 7 files changed, 333 insertions(+), 403 deletions(-)

