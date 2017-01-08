Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=mXitGqByanamDcsX6Tka1HLq/O1QMVvcTjtt0YvLxsM=;
 b=uDc0VMSp3S+QMaC4nTXcYv61vL/RrBK3oizpc7t6PNseQ4arZ7KqErKFpwtl6ar7NE
 ZEXVrf/IyirLkIkJdoUhShAwwSKZXzNr/N1LDP8p2d9vXu/cJUej3+ZiVyMHmFss9oz/
 ZUWUKGjhRmIyow4MKHGyI88TN4QFvORHI78E1wZgUKfcJN6hqVc3PXEXUBo2hZF+8OJ4
 gwy1UpHvboLs01i5xIu8Naa/92zOJ2VN0mbqHw2MgeU6AZFPhVP2xXeoyOcyoUn1xyn1
 V41+LQuBxDDdKgtnk0qr9Qc/NXIOh61SOB6pEAGh2vE1jRfpEykI1dAgScdbqoatB3sQ
 ZOqQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] appendix/questions: Add missing NBSPs
Date: Mon,  9 Jan 2017 01:34:45 +0900
Message-Id: <20170108163445.26748-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 appendix/questions/after.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/appendix/questions/after.tex b/appendix/questions/after.tex
index cbba768dd443..e648667614a4 100644
--- a/appendix/questions/after.tex
+++ b/appendix/questions/after.tex
@@ -184,13 +184,13 @@ SMP code?
 Simply use SMP primitives as designed.

 In this example, the easiest fix is to use locking, for example,
-acquire a lock in the producer before line 10 in
+acquire a lock in the producer before line~10 in
 Figure~\ref{fig:app:questions:After Producer Function} and in
 the consumer before line~13 in
 Figure~\ref{fig:app:questions:After Consumer Function}.
 This lock must also be released after line~13 in
 Figure~\ref{fig:app:questions:After Producer Function} and
-after line 17 in
+after line~17 in
 Figure~\ref{fig:app:questions:After Consumer Function}.
 These locks cause the code segments in lines~10-13 of
 Figure~\ref{fig:app:questions:After Producer Function} and in lines~13-17 of
-- 
2.10.0

