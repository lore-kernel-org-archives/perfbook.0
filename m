Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=/+ISZfLAmxe61/ni0gxrWWWew1kMLE2tgGq7MbkYFFQ=;
 b=vdMlAeqoz1trkmCRCH3ZnDLwTOhgrUus0Qf2rYO2aTg7czJSt9t0Y8VgosABCRBPHn
 Jkbl0ib4f2vp+D9PJ0CkeBXNNvCpZ17FZBzB/jMVC5AYabeAe5Z1zDwpbxTADSkfTqmp
 /6Hx/thO2/9QrTu9LGBeqtxPS9Tzh3RW8mAi1iZjrzYQVlZtOzRfeYOSIsvV8+EpTyEc
 tb7b5IEUSGZYle8goPy6bgOToJMaKcMMu3XKiSZNMd0969wSONQU8JzreM2w60GEIQ5o
 MIpX1Oo66Sy22l2NUg/puQ6xiAk1tCVxDMvkOVYSltU5rp75gm0KeVkyG587JA/1inDN
 l8Kw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/5] Convert to "description" list
Message-ID: <97daedea-d454-cdf6-0111-8089ef0678c8@gmail.com>
Date: Fri, 10 Mar 2017 00:18:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From e4a223315e3db9ffe303a95e15ee662935baaea9 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Thu, 9 Mar 2017 23:57:00 +0900
Subject: [PATCH 0/5] Convert to "description" list

Hi Paul,

This is the follow-up set of patches. It includes:

  o Use "enumitem" instead of "enumerate"
  o Convert to "description"

Conversion to "description" looks reasonable changes for me.
Let me know what you think.

There are other candidates of similar conversions in Appendix B,
But as you mentioned earlier that the appendix needs update
(or replacement by a newer article you posted the other day),
I'm not sure if it is worthwhile to do changes there, and stopped
short of posting patches for the appendix.

                                   Thanks, Akira
-- 
Akira Yokosawa (5):
  Use 'enumitem' package instead of 'enumerate'
  intro: Move ':' to tail of 'description' label
  debugging: Convert to 'description'
  formal: Convert to 'description'
  together: Covert to 'description'

 debugging/debugging.tex | 10 +++++-----
 formal/dyntickrcu.tex   | 14 +++++++-------
 formal/spinhint.tex     | 12 ++++++------
 howto/howto.tex         |  2 +-
 intro/intro.tex         | 10 +++++-----
 perfbook.tex            |  4 +++-
 together/refcnt.tex     | 30 +++++++++++++++---------------
 7 files changed, 42 insertions(+), 40 deletions(-)

-- 
2.7.4

