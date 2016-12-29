Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=dQw0/vWQihqXyp3KGBJO5lfa685y9hPLucEUI85V6qQ=;
 b=W7nzoqYeq6vvr/ouno1aLnLSOe2fnMTn9eInw89UL4cX6q6w7biDo9IIWQCZuJLDIl
 e7xATz6l7j/n3VFptxq4NIdjZw6heBsSK1y5Zgd7oSq4KplmTMwvufTlIoEetgI9wxWM
 gF8XUjUq1DNlvoeE+FL9I5P/0L5JApLoMcmQBFg3yRzah7hbjwMaotKYzbM9g95s2e3l
 FjbeLz+oWdygpDcVumMA4DXcLKtpEQMg6O+gH9Y8X4U9eYg5sX5T1lx4SbQ4gGmGovio
 45JUnYGZps9PpHE+BMCl+XsJR/8r1u482WOV8hiVgQEmM4HSiE9QsG52oSwZU0F67kuN
 mo9A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Q] READ_ONCE(x)++
Message-ID: <0da22bdc-5d80-ee43-0abc-745abb8a9155@gmail.com>
Date: Thu, 29 Dec 2016 11:54:02 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

As I'm not so familiar with Linux kernel programming,
I found the following hunk in commit 7945ae1a06c5 difficult to grasp at first glance.

@@ -564,7 +584,7 @@ the other will wait until the first thread releases the lock.
  38     exit(-1);
  39   }
  40   for (i = 0; i < 3; i++) {
- 41     ACCESS_ONCE(x)++;
+ 41     READ_ONCE(x)++;
  42     poll(NULL, 0, 5);
  43   }
  44   if (pthread_mutex_unlock(pmlp) != 0) {

"The name READ_ONCE() seems to imply it is used for read access, but what
happens when it is used with a "++" operator?" was what I thought.

"ACCESS_ONCE(x)++" was already somewhat confusing for me.

Once you know its definition, you can see there is no problem. But it still
looks strange...

Don't kernel programmers feel strangeness in "READ_ONCE(x)++"?

This is just a random question. But if you could add some explanation of the
usage, that would be of help for novice programmers.

                                            Thanks, Akira

