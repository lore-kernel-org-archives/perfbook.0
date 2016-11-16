Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=gUWmD0CD4ALGhZ0pNT/jWDAc/87pXM4f07OqeTLKrAo=;
 b=glXmmP1YXpjgJjwO2VUGJPbBGLzW4D9nSpoFQJhM6r0lRp29NApadyaNcoxMxy80xn
 OWdc1ECEc2tm0roooVDGvddrOmOjFqZxNo5kglbJ1EWp8hxqRtC2PKZVzCZ7MOHz8j0K
 Whdhk7A2LWuh25oU59NimviIIfBGIrQILUTpwXPlHFpHtW9MsCKitUL5iBCb5XCly2dH
 3Ku/v3cnRFtKARAPyBAzBnC3JnqLZMTTBU7AUbue+74mFAu505eGvqI7nvkY+XIgcJlY
 hrKhDzX3xVwIyfttmjKHzYPUtNCxBVm5dnLzm6CTD6TilZ/CHHtptMTvvG9avC+9BU7U
 iaEQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/3] Adjust labeling of chapter and appendix
Message-ID: <74e04f98-adb1-cd0d-7b6f-bbd550a6ea56@gmail.com>
Date: Wed, 16 Nov 2016 09:57:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 08d86c4db893e5b689c4d051b765006ce507c45c Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 16 Nov 2016 09:43:11 +0900
Subject: [PATCH 0/3] Adjust labeling of chapter and appendix

Hi Paul,

"bib" cleanups aside, I noticed a few inconsistent labeling of
"formal" and "whymemorybarriers".
This patch set adjusts them.
                                          Thanks, Akira

---
Akira Yokosawa (3):
  formal: Promote \OriginallyPublieshed macro to Chapter
  appendix/ack: Adjust labeling in 'Reviewers' section
  treewide: Adjust labeling of 'formal'

 appendix/ack/ack.tex            | 8 ++++----
 appendix/rcuimpl/rcupreempt.tex | 2 +-
 debugging/debugging.tex         | 2 +-
 defer/toyrcu.tex                | 2 +-
 formal/dyntickrcu.tex           | 2 +-
 formal/formal.tex               | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.7.4

