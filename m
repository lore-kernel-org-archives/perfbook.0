Return-Path: <SRS0=SbQd=BI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EA1pJtyRdHlDble0YM4ApKztEiCxAKzx0Tl5QmUbkKM=;
        b=m3Qj09CLwmYzvlobQ7RyJgh6fWFaUKwVHEwA/Y0PabnZNYPF46EKfBgQYMYcdns2uE
         63bMSK7eZuIQcjfNvN7RGAiZSKQgp+vT/ARfMUQiAbNOJC9tjtfN+drqnVufDq0WSa/C
         /3a78XAYaFKmjn/hABb4Du2T3lTNDEc+3W3XYFY71OmoOU2bER+7VMSqhb6UejcvB4gl
         M03qVJHnMEtveGyaPKpF0tbuCBYPbWL8bckkBy0d6I9nTtIlOe/Nh8up9ijtOOsrABSl
         qg5aNrfyYC4310hYbUveu0xrSI2FbAPi8OWsoDW7P0v46h+mnqctfTine1ZTRWSgrrYH
         J0CQ==
Subject: [PATCH 4/5] datastruct: Use nbsp in captions (State (a), State (b),
 etc.)
References: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8bae7c70-0d90-814c-d886-314709b93ff1@gmail.com>
Date: Thu, 30 Jul 2020 00:18:17 +0900
MIME-Version: 1.0
In-Reply-To: <abceee6f-6520-bcb5-781d-a53b0adfa5b7@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 05b67c1d4b598ac44fb159c1e6d8a56cdc17838f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 28 Jul 2020 11:33:56 +0900
Subject: [PATCH 4/5] datastruct: Use nbsp in captions (State (a), State (b), etc.)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 16dc2286..c279115d 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -840,14 +840,14 @@ concurrently with a resize operation (as well as with each other).
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{datastruct/hashxu-a}}
-\caption{Growing a Double-List Hash Table, State (a)}
+\caption{Growing a Double-List Hash Table, State~(a)}
 \label{fig:datastruct:Growing a Double-List Hash Table; State (a)}
 \end{figure}
 
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{datastruct/hashxu-b}}
-\caption{Growing a Double-List Hash Table, State (b)}
+\caption{Growing a Double-List Hash Table, State~(b)}
 \label{fig:datastruct:Growing a Double-List Hash Table; State (b)}
 \end{figure}
 
@@ -868,14 +868,14 @@ with readers still using the original two-bucket array.
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{datastruct/hashxu-c}}
-\caption{Growing a Double-List Hash Table, State (c)}
+\caption{Growing a Double-List Hash Table, State~(c)}
 \label{fig:datastruct:Growing a Double-List Hash Table; State (c)}
 \end{figure}
 
 \begin{figure}[tb]
 \centering
 \resizebox{3in}{!}{\includegraphics{datastruct/hashxu-d}}
-\caption{Growing a Double-List Hash Table, State (d)}
+\caption{Growing a Double-List Hash Table, State~(d)}
 \label{fig:datastruct:Growing a Double-List Hash Table; State (d)}
 \end{figure}
 
-- 
2.17.1


