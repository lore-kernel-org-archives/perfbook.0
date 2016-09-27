Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zwXh4BuGWAEucguXZXOCgAzxYjrwB2K/tAzN+GfIX1s=;
 b=hfCpqjubWn7VtCs4vIYnkCcu/HzI6ey21vszrEGWHaUfQyT4X5Vnse1xaMzLXt8bMT
 C2JW9TEtf0V4H1lr98FRiHE2+RUUPbk2Lzti2POGfRKetBFagjReUqdmPBGQZ0hDLA0r
 fVgxQM2G+kk+l617JCSemz6hcYybk1vq/w6GyHkJr9D3Gyjmx6LIOQnZlbMy07//NFnL
 928C3nJW1SQTPIhmdfZ9rVaLpMr2bCJ1NaCNSbTOXrzoiuE05YxiJN2QCK1yup0AdVWf
 3z5EN0rqvQQInwGk7E9XytXhHgOC7BeJp7q2H/OD048nwKTzbje5hEOE9xk8DaLP1hSz
 0deA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 16/17] formal/ppcmem: Polish a sentence by removing
 unnecessary conjunction
Date: Wed, 28 Sep 2016 06:56:40 +0900
Message-Id: <20160927215641.7330-16-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/ppcmem.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/ppcmem.tex b/formal/ppcmem.tex
index 743a891..7dc9675 100644
--- a/formal/ppcmem.tex
+++ b/formal/ppcmem.tex
@@ -233,7 +233,7 @@ The next section describes how to run this litmus test.
 \subsection{Running a Litmus Test}
 \label{sec:formal:Running a Litmus Test}

-Although litmus tests may be run interactively via
+Litmus tests may be run interactively via
 \url{http://www.cl.cam.ac.uk/~pes20/ppcmem/}, which can help build an
 understanding of the memory model.
 However, this approach requires that the user manually carry out the
-- 
2.10.0

