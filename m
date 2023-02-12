Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDvX3h5F0p0JeMAPWOuFRuZaQnsweiP5sZlkXvbBbfc=;
        b=IhIS4J39wXEgI2BuMs7O7vOzyM3Jox880WSsIoDSKCG1MFD6tCJuMBphJ549lpeFdx
         EFE23vOl7cEHM2XqzY/BuaeMONknAN6xonmThJ3jFwtZtS3rt34nT3RTZ6fk4Cv0uwDm
         jb9ta5XVAH8NB8XybU2cDdTztiEgFA2TZq2iDXvA8Jt8lWeI5bZFmMgL51Wj/jzt5J0X
         PpNMKUA+4WGqpCVqu6/B1ViM/dSXJCkL+WW3K0pmyXf0MgkU78jGxOcsoH2P5/ZTFWw+
         kT7LDSu36zSKt3OY59NUVYUYg+8kl/hZOT5rWJOMGF3JFVm4Yidqr1lAzeEyaZLFMk2i
         AyFw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 2/4] debugging: Use \co{} and \qco{} for 'git' and 'Fixes:', respectively
Date: Sun, 12 Feb 2023 08:56:28 -0800
Message-Id: <20230212165630.26268-3-sj38.park@gmail.com>
In-Reply-To: <20230212165630.26268-1-sj38.park@gmail.com>
References: <20230212165630.26268-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj@kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

In 'debugging/', 'git' is a command and 'Fixes:' is a string in command
output, which usually enclosed via '\co{}' and '\qco{}' respectively,
but those are enclosed with '\emph{}'.  Use '\co{}' and '\qco{}'
respectively, instead for being more consistent.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index fde2d446..4dfb1229 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -862,8 +862,8 @@ by the author's invalid assumptions, and who might also test the code.
 	hackers of harboring???
 }\QuickQuizAnswer{
 	Those wishing a complete answer to this question are encouraged
-	to search the Linux kernel \emph{git} repository for commits
-	containing the string ``Fixes:''.
+	to search the Linux kernel \co{git} repository for commits
+	containing the string \qco{Fixes:}.
 	There were many thousands of them just in the year 2020, including
 	fixes for the following invalid assumptions:
 
-- 
2.17.1

