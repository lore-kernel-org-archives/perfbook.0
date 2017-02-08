Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=1FDoG2wlcaBOsg+RvtpCFdC6jid5gNLeK0BZvABWm6Y=;
 b=aOOzuXw6LRzJ6vFJoQJmI7IJ2hcFFwrgsnC25VjjEdoC0hgpwaixyeruunJHdB8v0f
 vyuisTsD8ar+pahLa9r4agD6JH7h1REcQqMnouknTs0gxn9MDAnA3BnrNdvOYKIlnLTa
 QDUxU47jo2Wo+8vxP11PmS+J5IhkrKCXQDBbVxLj9lZs6bv71rUp614b5jOcE9T6JB6A
 sd/h4jY9m6WZw4oEg+IT2LMsas0hvvyLbeLhMKGd/L9gjAhqchwLtgY4+FNwhnQpb7US
 0BRsQjgNhC2XzM0Y7e8tE9C0rUrS32HzT8Vr765MSY9nx+ARciejGUZ7zKjKWCUl9IKi
 aGPg==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Bibliography update round 5
Message-ID: <3aa61663-43c2-6663-278a-2554ee4d5736@gmail.com>
Date: Wed, 8 Feb 2017 23:54:41 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 58a0655ab2b5c555bd19a6d7624a9d4413cf1360 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 8 Feb 2017 23:34:47 +0900
Subject: [PATCH 0/5] Bibliography update round 5

Hi Paul,

Here is round 5 of bibliography updates.
Patches 1, 2, and 3 take care of broken urls. Patch 2 contains an
alternative link to a webpage capture.
Patch 4 is cosmetic fix of UCB in author fields
Patch 5 is a different type of update. It adds awareness of "location"
field in "inproceedings" entry. Please see the commit log for details.
I think this is a reasonable change for perfbook.

                                             Thanks, Akira
--
Akira Yokosawa (5):
  bib/maze: Mark url of ETHZurich:FS2011maze as broken link
  bib/syncrefs: Mark url of DougLocke2002a as broken
  bib/syncrefs: Mark url of Victor2002a as broken
  bib/parallelsys: Properly format UCB in author field
  alphapf.bst: Make use of 'location' field in 'inproceedings' entry

 alphapf.bst         | 47 +++++++++++++++++++++++++++++++++--------------
 bib/maze.bib        |  4 +++-
 bib/parallelsys.bib |  4 ++--
 bib/syncrefs.bib    | 14 ++++++++------
 4 files changed, 46 insertions(+), 23 deletions(-)

-- 
2.7.4

