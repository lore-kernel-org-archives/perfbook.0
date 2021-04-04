Return-Path: <SRS0=ALPs=JB=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zzM1yypPyLxO+PwDZt2di9c1tO1mzIqzuFNvCFlKIMA=;
        b=dfF+hV0fHqHrjDoDzZC9FEQcd+4J38LIMQXxKeeAR9Kjg+VGhNbSNutg+Z9jh/cEr0
         Wc2FLIQXd7Oo88q26GcQEzAnwjRnulope8GX4+cd4m6vaRYMEaOFTpiB8zTyaxATyGc8
         E1AKQn610IWgbDd5b20Ek2DrIt2/fMOxfUxA2n5/z06JxlGyUqrlctBAMkZAUgLnPVNE
         s1309pta2opo6J+PIgixD1NryY/uAKbKwhhmM+QN1C/ibDdwMw7/rLX/Kr24UbP/aeq6
         X1A7ynhk10z1cztKW5ed6z6nyPZNs0WFZM22rL0WyuwugXOBQIhYwIJX8WSXq9Wlc1Ok
         4+9Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 3/4] howto: Provide a hyperlink to 'submitting-patches.html'
Date: Sun,  4 Apr 2021 12:05:02 +0200
Message-Id: <20210404100503.20978-4-sj38.park@gmail.com>
In-Reply-To: <20210404100503.20978-1-sj38.park@gmail.com>
References: <20210404100503.20978-1-sj38.park@gmail.com>
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
index 2f07c8a7..1c279e9a 100644
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

