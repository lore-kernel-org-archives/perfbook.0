Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=E2LOWmtEUIvt2OcSc9igNPA/WbTZt3Eo0XQSuYCCOyc=;
 b=Vc6eeXpq1hOECohxnL189lfbrzq2+/KoBmfroZOPdJpu2ME0U132aWkmKZZ7rsVPXO
 +39j5EOlej1xbDlnl1g2vMldVK+toWA618asb6XDhrnhOpFsfBmsvumMZQUAVE+nb9lI
 oIcmNY2HgBNZKfjSta0vYRL1ynEX7gtFXxr5w6fCB0EUK7myIzxHqgYHoVbfkUpAetDN
 iA49UvJTOEku60OZ77CVE1b76wya0pQg55y7m52O1NWEMFCTDMgWM0kHCpg63owVWL6h
 1Rth81S17dF/kNihQDVnFWmHjQ1JyqlxLtjfBCDvqws6tK2v9fgu5i3kx3ex5xuWyDxD
 1Cnw==
Subject: [PATCH v2 0/1] Trial of replacing hyphens with minus signs
References: <32c543fd-cad8-f3da-4b1f-15ed2fd919c0@gmail.com>
 <20160808163608.GJ3482@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5d1f41dd-a4f1-81f7-cc6c-b9ce8c229f88@gmail.com>
Date: Tue, 9 Aug 2016 23:04:34 +0900
MIME-Version: 1.0
In-Reply-To: <20160808163608.GJ3482@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f4068f222bfa4f1cb60b9c16e9228990bc886280 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 Aug 2016 22:28:34 +0900
Subject: [PATCH v2 0/1] Trial of replacing hyphens with minus signs

This is round two of my attempt to avoid using hyphens as minus signs.

First of all, I didn't intend to mark up every number in the text.
The reason I used two latex commands was to make it easy to try
several different combinations of appearance in the resulting PDF.
Once we choose one combination, we can replace the mark-up commands
by automatic scripting.  I prepared two types of mark up because
there already exist numbers enclosed in \co{}.

I should have made this point clear in the previous series cover
letter.

This time, I choose the simple math mode for negative numbers. I think
this is acceptable enough.  I'm not sure if we should also use \co{}
for some negative numbers.  This can be discussed later.

BTW, I used a script to find candidates of negative numbers. 
Although it outputs a lot of false positives within verbatim and \co{}
code snippets, it is still useful as hints.

Following is the diff of "before" and "after" of the output of the
script.  I hope this can help you grasp what it looks like.

                                                Thanks, Akira

------
--- /tmp/before	2016-08-09 22:11:29.061603725 +0900
+++ /tmp/after	2016-08-09 22:11:50.129602753 +0900
@@ -1,8 +1,4 @@
-./future/htm.tex:642:	to -1.
 ./future/htm.tex:656:  1   int my_status = -1;  /* Thread local. */
-./SMPdesign/beyond.tex:272:which must be initialized to all [-1,-1].
-./SMPdesign/partexercises.tex:277:be assigned decreasing numbers (-1, -2, -3, \ldots), while a series of
-./SMPdesign/SMPdesign.tex:1000:element of the \co{pool} array, or -1 if all elements are empty.
 ./count/count.tex:787: 40     exit(-1);
 ./count/count.tex:3062: 10     exit(-1);
 ./together/applyrcu.tex:148: 36     exit(-1);
@@ -14,7 +10,6 @@
 ./toolsoftrade/toolsoftrade.tex:188:  7   exit(-1);
 ./toolsoftrade/toolsoftrade.tex:228:  8     if (pid == -1) {
 ./toolsoftrade/toolsoftrade.tex:232: 12       exit(-1);
-./toolsoftrade/toolsoftrade.tex:259:If the process ID is instead -1, this indicates that the \co{wait()}
 ./toolsoftrade/toolsoftrade.tex:294: 12   exit(-1);
 ./toolsoftrade/toolsoftrade.tex:395: 18     exit(-1);
 ./toolsoftrade/toolsoftrade.tex:399: 22     exit(-1);
@@ -34,15 +29,7 @@
 ./toolsoftrade/toolsoftrade.tex:739: 19     exit(-1);
 ./toolsoftrade/toolsoftrade.tex:883: 25       exit(-1);
 ./toolsoftrade/toolsoftrade.tex:890: 32       exit(-1);
-./appendix/questions/after.tex:146:17563: & 1152396.251585 & (-16.928) & 27 & 27 & 27 \\
-./appendix/questions/after.tex:147:18004: & 1152396.252581 & (-12.875) & 24 & 24 & 24 \\
-./appendix/questions/after.tex:148:18163: & 1152396.252955 & (-19.073) & 18 & 18 & 18 \\
-./appendix/questions/after.tex:149:18765: & 1152396.254449 & (-148.773) & 216 & 216 & 216 \\
-./appendix/questions/after.tex:150:19863: & 1152396.256960 & (-6.914) & 18 & 18 & 18 \\
-./appendix/questions/after.tex:151:21644: & 1152396.260959 & (-5.960) & 18 & 18 & 18 \\
-./appendix/questions/after.tex:152:23408: & 1152396.264957 & (-20.027) & 15 & 15 & 15 \\
 ./rt/rt.tex:1360:	\co{echo -1 > /proc/sys/kernel/sched_rt_runtime_us}
 ./rt/rt.tex:1711: 3   exit(-1);
 ./rt/rt.tex:1715: 7   exit(-1);
 ./rt/rt.tex:1719:11   exit(-1);
-./datastruct/datastruct.tex:1076:The \co{->ht_resize_cur} field on line~14 is equal to -1 unless a resize
------ 

Akira Yokosawa (1):
  Trial of replacing hyphens of negative values with minus signs

 SMPdesign/SMPdesign.tex       |  2 +-
 SMPdesign/beyond.tex          |  2 +-
 SMPdesign/partexercises.tex   |  2 +-
 appendix/questions/after.tex  | 14 +++++++-------
 datastruct/datastruct.tex     |  2 +-
 future/htm.tex                |  2 +-
 toolsoftrade/toolsoftrade.tex |  2 +-
 utilities/findminusnum.sh     | 29 +++++++++++++++++++++++++++++
 8 files changed, 42 insertions(+), 13 deletions(-)
 create mode 100644 utilities/findminusnum.sh

-- 
1.9.1

