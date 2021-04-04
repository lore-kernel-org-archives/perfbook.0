Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mZWpqLSJsXkrEEomr/t3DncUulag88/RxIUdjMgkZ98=;
        b=Y/he/C6DlhsbBK8iXmhBg4oIVre7aDpw3/CzuIBHXqgKD+czt94jP41h/BUUyPQy08
         8wDwCdkZu22bwQy9DGco+F0/13A0tPzmtLDvpi390ufFAkilPwcjwgCld9nFaI3u6MKq
         FKQmwXLhWH4HX8vOdumyu3rw1glVYEVug0fZw/fi1kD7MSxq4LAJCoaZftENtrfGpyoF
         9k8Q3DLr3/kFG5kccklDdW2y1spfYP/5alMOkZM04plxpTnY/H9+J7nMdEve7jI+moOJ
         AfD4wnnGDh76ya7RJG9hH13tQOERAkv2luIqmhjqdbE6yIAdDv1QrDozW2GQcxbLCBm8
         G/tQ==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 3/4] howto: Provide a hyperlink to 'submitting-patches.html'
Date: Sun,  4 Apr 2021 13:10:43 +0200
Message-Id: <20210404111044.27774-4-sj38.park@gmail.com>
In-Reply-To: <20210404111044.27774-1-sj38.park@gmail.com>
References: <20210404111044.27774-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, akiyks@gmail.com, SeongJae Park <sj38.park@gmail.com>
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
index 5bbf8c39..9b3f8e91 100644
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

