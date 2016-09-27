Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3Yjrk3ix1JT3r/F+rQLSLxvO/aKPeDPShi4chp2OLXw=;
 b=qBFPP6ffr5sfEwMio58s2SdkteuzkpErZOAALmoblSV1wWIEONCS4kpsKPCAtgcjNM
 RC2UcI7xQlH6ZcIfV+pLEuR8KBzf+lLnX6IbiRv8TPIVuV/uNpqHsYrvrcb2wx1vWq0O
 OX/s65Bjm8MvgkYaaVf0J+RlY9owvhponnx4OXuF49wYk/JpEtPCOEUlWyz+oGc3AcOt
 IR1YqpD/iW8mnTCdZwbfb62dPsvjgZ7TRrzabGn6QiK26rm6FxKiyF93tCYh9QKz7x1U
 XI0BXX07mCxHjC1Q9asU4Z+JtlmHSpbfEO1PYSgKLsojA9t+kgA39WmbDXyCgBpIjlDm
 GWPg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 06/17] formal/spinhint: Reference figure
Date: Wed, 28 Sep 2016 06:56:30 +0900
Message-Id: <20160927215641.7330-6-sj38.park@gmail.com>
In-Reply-To: <20160927215641.7330-1-sj38.park@gmail.com>
References: <20160927215641.7330-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 formal/spinhint.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/formal/spinhint.tex b/formal/spinhint.tex
index 878fa61..ec53a7f 100644
--- a/formal/spinhint.tex
+++ b/formal/spinhint.tex
@@ -1096,7 +1096,7 @@ to 0 (so that line~14 will fetch the second counter).

 With the \co{sum_unordered} macro in place, we can now proceed
 to the update-side process shown in
-Figure.
+Figure~\ref{fig:analysis:QRCU Updater Process}.
 The update-side process repeats indefinitely, with the corresponding
 do-od loop ranging over lines~7-57.
 Each pass through the loop first snapshots the global {\tt readerprogress}
-- 
2.10.0

