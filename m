Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=S2sBSSlnZSoNRvZXMjHzjRE0T7bVOXzTKmQh4ofGnN0=;
 b=lMp2llYTB9hPu3x6iCAVgEZ+cfBVnXd0TRkH9e0NGXfMMaCDS6CrlA1ZdLLOlmPamj
 eyXUP7bt/mA/E5Nxi8h8N6RRMIOphkVgc8NYYCvfXeeQ8St7Kc68wnGLRar53y3KEC9o
 DyyCwcX9EmqN4Kte3LrJ5hk1pSc37JC5kmTZyrtT6mjBkPXPY6GqZaVa+aR+zi9hjMmz
 +mFr6xH/DEbbGGJSaaZEEwdlZDgJiDvUm545J9juhlfIMWNh7q2ALD1iZlUOWabQMsOV
 SvBjAo4RS4zCq/T4U1bRKiG4oAO5QI7j8KUlV55L/LVV/4fATpJVUIz7RCvEwTlhUWt7
 m3hw==
Subject: [RFC PATCH 5/7] advsync: Make code snippets more asm like
References: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5a8ec3fb-faf4-72ac-a524-e5cbea130bc7@gmail.com>
Date: Sat, 25 Mar 2017 18:40:22 +0900
MIME-Version: 1.0
In-Reply-To: <ef9bafef-1f79-ebb1-18b1-8c0adc695b4b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From eee8c456dd18cd262a88581acdba1082df6d5315 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sat, 25 Mar 2017 17:45:29 +0900
Subject: [RFC PATCH 5/7] advsync: Make code snippets more asm like

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 advsync/memorybarriers.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
index 9b8c4c5..da464fd 100644
--- a/advsync/memorybarriers.tex
+++ b/advsync/memorybarriers.tex
@@ -2553,7 +2553,7 @@ demonstrates transitivity with initial values of
 \begin{tabular}{l|l|l}
 	\nf{CPU 1}	& \nf{CPU 2}		& \nf{CPU 3} \\
 	\hline
-	X = 1;		& LOAD X		& Y = 1; \\
+	STORE X = 1	& LOAD X		& STORE Y = 1 \\
 			& <general barrier>	& <general barrier> \\
 			& LOAD Y		& LOAD X \\
 \end{tabular}
@@ -2589,7 +2589,7 @@ is changed to a read barrier as shown below with the same initial values of
 \begin{tabular}{l|l|l}
 	\nf{CPU 1}	& \nf{CPU 2}		& \nf{CPU 3} \\
 	\hline
-	X = 1;		& LOAD X		& Y = 1; \\
+	STORE X = 1	& LOAD X		& STORE Y = 1 \\
 			& <read barrier>	& <general barrier> \\
 			& LOAD Y		& LOAD X \\
 \end{tabular}
-- 
2.7.4


