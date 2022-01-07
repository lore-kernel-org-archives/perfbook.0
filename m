Return-Path: <SRS0=fMf1=RX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=kYZeoZHHRu8cvFS6pX46rxEEXimTko8cx1HyXBz6bEM=;
        b=G2SMBgpxU9+DJWnFovKu7fueX0wRSiCstanns+60/96/pLCq9qqp+YV4F9jl1xhnOd
         uFWRAjzTa3lRjSuwGFHVBgX0UfrVPwJT89qOplLRl8Usnu0rQ5ECwSG7wi6mmdGImz+4
         8LRfxtf5GGAmHnvL6q0k3q3q9nHQ8RY6hlyQI75o3VVZL8Tt4t9fukRPmvHb3OfqPotX
         sWnm1UvyqSpPVLEO6lHkdURDYxPBa0EtMBsfDolNvCwwb7kUkY5eTv5VpZD+aXUwEey7
         U5ovpXHGywoO8I2WkeIu0COYHgdEH+17aJepb9rvEPb4QiAyLBx3AeW41ieC5/yA7mpN
         d5kw==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] defer/rcuintro: Tweak appearance of new Table 9.1
Message-ID: <31e91d36-74df-da18-29fa-06ce20154e58@gmail.com>
Date: Fri, 7 Jan 2022 23:36:42 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Shrink the table width so that it can fit in 1c and eb builds.
Overall appearance is based on Table D.8 in Style Guide.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 defer/rcuintro.tex | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index dbea667f..db87b9f6 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -235,22 +235,24 @@ to initialize the pointed-to structure.
 }\QuickQuizEnd
 
 \begin{table*}
-\renewcommand*{\arraystretch}{1.15}
-\footnotesize
+\renewcommand*{\arraystretch}{1.25}
+\rowcolors{2}{}{lightgray}
+\small
 \centering
-\begin{tabular}{lll}
+\ebresizewidth{
+\begin{tabular}{llp{2.4in}}
 \toprule
 &
 	Primitive &
 		Purpose \\
 \midrule
-\emph{Readers} &
+\cellcolor{white}\emph{Readers} &
 	\tco{rcu_read_lock()} &
 		Start an RCU read-side critical section. \\
 &
 	\tco{rcu_read_unlock()} &
 		End an RCU read-side critical section. \\
-&
+\cellcolor{white}&
 	\tco{rcu_dereference()} &
 		Safely load an RCU-protected pointer. \\
 \midrule
@@ -258,7 +260,7 @@ to initialize the pointed-to structure.
 	\tco{synchronize_rcu()} &
 		Wait for all pre-existing RCU read-side critical sections to
 		complete. \\
-&
+\cellcolor{white}&
 	\tco{call_rcu()} &
 		Invoke the specified function after all pre-existing RCU read-side
 		critical sections complete. \\
@@ -267,6 +269,7 @@ to initialize the pointed-to structure.
 		Safely update an RCU-protected pointer. \\
 \bottomrule
 \end{tabular}
+}
 \caption{RCU Core API}
 \label{tab:defer:RCU Core API}
 \end{table*}

base-commit: f21271f0939bb620a95b1bb3d76ac0259c4bb54c
-- 
2.17.1

