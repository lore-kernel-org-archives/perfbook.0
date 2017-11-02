Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=opyeG0a8grMGH09krq6tgzcbhl4oVRsze1zbsl0/CoU=;
 b=rZ/nb3EzhfJgSU3KT5fq4LR8q+PMcd13FOD4vs8CdK1nHo6Pf0cxl/nrlc1iMAYib/
 BBwHw1gCPUIuMzMKByR4P3RB2lDp4QcnKp59w57jDrLQLJ8RLoA/Nbm2rd8spAUuE7mk
 r07drKhRxFpE2HfKT+LqiB8gImm75TZrK4OqESqzKqSCwFI3JOGeTHO+hpsrlE0csuyC
 cTeebWyiCvvaSZ7O001QrzMUs4niLYK7WWA3Btrr8crcN0va69+Rin3jIVWfehJBUqGh
 BsfjdaQ2xXDbVs4rHqSRNeEh54CjD4N+eYVp/dY0Ebdr4aV9gYQ85yRZW/GWw3pe4bk1
 Sjrw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [NOT A PATCH] Question on regression by bug fixes
Message-ID: <8c6af34c-7cc5-492d-14c6-d6bc990da24b@gmail.com>
Date: Thu, 2 Nov 2017 23:19:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul

I couldn't follow the reasoning around the following _artificial_ hunk.

diff --git a/formal/regression.tex b/formal/regression.tex
index 29cb787..9831b9d 100644
--- a/formal/regression.tex
+++ b/formal/regression.tex
@@ -387,6 +387,7 @@ To see this, keep in mind that on average, every six fixes introduces
 a bug.
 Therefore, fixing the 24 bugs, which had a combine mean time to failure
 of about 40,000 years, will introduce three more bugs.
+???
 These three bugs most likely fail more often than once per 13,000 years,
 so the reliability of the software has decreased.

Where did the "once per 13,000 years" come from?
13,000 was derived from 40,000/3?

But in this argument, original 24 bugs are fixed, and 3 new bugs are introduced.
We have no idea what failure rate the new bugs would have, don't we???

What am I missing?

    Thanks, Akira

