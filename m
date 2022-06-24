Return-Path: <SRS0=xThF=W7=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h+0Yfic7xO48KUslgE2yALK0jvAxuIkePTPDPEmBnqg=;
        b=OiGoVzbrwrAxshg9XoR5luIaUSNX3CB2BdveimZd1q2NE91QVnHWE5m5v1UhiXv7pu
         83FE9Xq0ne+LheX5d5/gtryI4Ejjla/+vPwLwIl4zsZkfnWNRF+emTIiGl5jME9Vkyzx
         IFpMiVVvsn3UV0NxCSQTtx0hAf9E9Qwkd35ZIYpXwIgXNd1KIwudhMLKvuhlkrGMseCB
         UVC+uwbvzh3owzTOTHux/nF4BlMbtrFtsc1LqNm04gBy8QFEAwSuOxtCX4eIfJmCA7zk
         nY7EnmtvisCWVhqTWMu4zd0BB29A/lIsYsRl3jPRvQ/H8funGBTo8yZrIAB4XhHEwsd3
         Ej7w==
Message-ID: <6329b0e3-2f56-c156-e5e7-883cb381f613@gmail.com>
Date: Fri, 24 Jun 2022 23:28:16 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 2/2] defer/whichtochoose: Fix trivial typos
Content-Language: en-US
References: <6957b314-8f59-9671-4adb-37206fc3c693@qa2.so-net.ne.jp>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <6957b314-8f59-9671-4adb-37206fc3c693@qa2.so-net.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akys@qa2.so-net.ne.jp>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/whichtochoose.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 95b355a1c471..489299a7ae02 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -83,7 +83,7 @@ techniques from one another.
 The ``Readers'' row summarizes the results presented in
 \cref{fig:defer:Pre-BSD Routing Table Protected by RCU QSBR},
 which shows that all but \IXalt{reference counting}{reference count}
-are enjoy reasonably fast and scalable readers.
+enjoy reasonably fast and scalable readers.
 
 The ``Number of Protected Objects'' row evaluates each technique's need
 for external storage with which to record reader protection.
@@ -336,7 +336,7 @@ has a \IXalth{bounded wait-free}{bounded}{wait free}
 it can carry out a finite traversal by executing a bounded number of
 instructions.
 
-The ``Reader Reference Acquisition'' rows indicates that only RCU is
+The ``Reader Reference Acquisition'' row indicates that only RCU is
 capable of unconditionally acquiring references.
 The entry for sequence locks is ``Unsafe'' because, again, sequence locks
 detect updates rather than acquiring references.
-- 
2.25.1


