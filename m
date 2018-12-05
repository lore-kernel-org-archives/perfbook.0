Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=OQ4sEhAxwLqvaflMvDpVyPKIZtyZnDJY+8y63eX2E4U=;
        b=pBRpjghGv3DKYlNZy22J50CyBvIKMyTWedRsxhIEQT9DG+KZawCjzkyYv6gXZvMmp/
         UObLl7UzkWr2QgRW+6adl8D0YG2SPmqlRkQkJBvUwWBl7U85MiJ3+QDM9/WFsTCsZXiq
         ZwllYrbgMeikH//ZkYC5SYwxEVAFmb2WqV1nI0Sd8RhrRGVUKUkPUzBJsTrjyHvFV4rK
         PAUMDSQFfIhKHh9EdTT5GaJdbl2Rl28QfepgL5/aGYGG8+GF4JvylCpZFoIVgnmo3tQV
         3bJsZzUrsZys0b2jBgM8CR/wDgsVU7no+V6uP3QP1I+4BE2kxSYP3vMUe5XUoUDa42GD
         N6tQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] count: Include atomic_nehalem.pdf instead of
 atomic_nehalem.png
Message-ID: <38fa0336-1150-7e92-bc00-b094b959f932@gmail.com>
Date: Wed, 5 Dec 2018 20:00:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 213fcdaabb6daa14c1c6cfc6ff780d023478d59f Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 5 Dec 2018 19:48:32 +0900
Subject: [PATCH] count: Include atomic_nehalem.pdf instead of atomic_nehalem.png

Without any suffix specified, \includegraphics{} prefers .png to .pdf
by default.

Fixes: 04e270767c34 ("count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Hi Paul,

This is a "minor fix".  Obviously, I missed to check the restored figure
before submitting the previous patch set. ;-)

        Thanks, Akira
--
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index 6fd54b5..bdbc4cd 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -248,7 +248,7 @@ accuracies far greater than 50\,\% are almost always necessary.
 
 \begin{figure}[tb]
 \centering
-\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem}}
+\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem.pdf}}
 \caption{Atomic Increment Scalability on Nehalem}
 \label{fig:count:Atomic Increment Scalability on Nehalem}
 \end{figure}
-- 
2.7.4

