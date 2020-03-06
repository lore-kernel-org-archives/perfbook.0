Return-Path: <SRS0=J1Hu=4X=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nAzAni5gG7gHIjf5gp7otSxSz4ETgpmxiEdijW8e9/c=;
        b=NuLQ6CnnAv20NNCJBmoLZQ4wv3Dz02TXo4bS9W6xc+mlHtvVI2fH7xxB+P97fJM8Dp
         AlCkf3q9TwqD76+IcAqplO6tLALqLZLrdXR7SoV98wFsOs6aYuvf0/AwQahGb4Pd9y/q
         NNooZ5tvHXlBxl11B65meFTca+Wh7TTsZodWynbrXd2UEKFm/gu8GZm0PefQCqsJsoas
         hKPvkOx0j4JkyXUv+JDpxT4LTIXf8XL3CmLnLMaIEBnXogQuNYcOYUV9wN44jiZ0PApQ
         YS92gRfWscYfQ7IOedBd34PfiZLNmikYSfWkEPJZdkHc1ko+4AdXAt5CFE22QyAu9bWI
         LM8A==
Subject: [PATCH 3/6] toolsoftrade: Use nbsp in front of single letter variable
References: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a5d41ae8-e6f3-a149-1bd4-f35ae48e39bf@gmail.com>
Date: Sat, 7 Mar 2020 07:50:05 +0900
MIME-Version: 1.0
In-Reply-To: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 415ec82df62f29b0901b124c6991f05117432835 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 6 Mar 2020 00:18:34 +0900
Subject: [PATCH 3/6] toolsoftrade: Use nbsp in front of single letter variable

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 toolsoftrade/toolsoftrade.tex | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
index 01529a0c..79d6c2cd 100644
--- a/toolsoftrade/toolsoftrade.tex
+++ b/toolsoftrade/toolsoftrade.tex
@@ -681,7 +681,7 @@ values of \co{x} stored by \co{lock_writer()}.
 \QuickQuiz{}
 	Wait a minute here!!!
 	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
-	didn't initialize shared variable \co{x},
+	didn't initialize shared variable~\co{x},
 	so why does it need to be initialized in
 	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}?
 \QuickQuizAnswer{
@@ -689,11 +689,10 @@ values of \co{x} stored by \co{lock_writer()}.
 	Listing~\ref{lst:toolsoftrade:Demonstration of Exclusive Locks}.
 	Because the code in
 	Listing~\ref{lst:toolsoftrade:Demonstration of Same Exclusive Lock}
-	ran first, it could rely on the compile-time initialization of
-	\co{x}.
+	ran first, it could rely on the compile-time initialization of~\co{x}.
 	The code in
 	Listing~\ref{lst:toolsoftrade:Demonstration of Different Exclusive Locks}
-	ran next, so it had to re-initialize \co{x}.
+	ran next, so it had to re-initialize~\co{x}.
 } \QuickQuizEnd
 
 Although there is quite a bit more to POSIX exclusive locking, these
-- 
2.17.1


