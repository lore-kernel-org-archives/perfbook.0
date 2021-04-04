Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gG2f3683PDUFhAZzGxZe0voM3hyJALbRl8X415lR/jE=;
        b=UyPVZnsRWfaw2aKcdiHCc+MECeZP0Tz9vAl0I0rRtvMO5NofSFcPCvhp215RqfQWjn
         zPP4dD4CMP33ZsSi6GzpXhobJTYb3wDKPl2gt0lkpcSbrwgtqFNycdg2qNNZkvGfj/3p
         +dktFRM627/D3OMzzIZyh31GvZCVH++lD30t2OTojpIBOEvviOCFNvtSsAYmSX+uX7OY
         nnSfU5q2Pd+jTgeJufDTYZm2eve3+dToZ3vBbtarmAuc2hs9asWdU4MraPpTvu/O/76m
         3TzQBIumUEFCImWKfC2JcVDQDdvUrR3uUVeooOW96MXW7PgApaDVQYpfTdwPoXF+X24o
         WuVg==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 3/4] howto: Provide a hyperlink to 'submitting-patches.html'
Date: Sun,  4 Apr 2021 09:50:09 +0200
Message-Id: <20210404075010.15858-4-sj38.park@gmail.com>
In-Reply-To: <20210404075010.15858-1-sj38.park@gmail.com>
References: <20210404075010.15858-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In 'howto' chapter, we point users to 'SubmittingPatches' file in the
Linux source tree to let them know the detailed contribution process.
The file is now converted to a '.rst' file and the rendered 'html' page
is available at 'kernel.org'.  Using the link to the page would be
easier for the users, compared to retrieving the Linux source tree and
then reading the 'SubmittingPatches' file, which now only directs reader
to the '.rst' file.  For the reason, this commit makes the change.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 howto/howto.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/howto/howto.tex b/howto/howto.tex
index fff71e6c..a0a4b755 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -489,7 +489,8 @@ and at
 
 The actual process of contributing patches and sending \co{git pull}
 requests is similar to that of the Linux kernel, which is documented
-in the \path{Documentation/SubmittingPatches} file in the Linux source tree.
+in the
+\url{https://www.kernel.org/doc/html/latest/process/submitting-patches.html}.
 One important requirement is that each patch (or commit, in the case
 of a \co{git pull} request) must contain a valid \co{Signed-off-by:} line,
 which has the following format:
-- 
2.17.1

