Return-Path: <SRS0=U30B=6I=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLDE8nnf4Lc7hzsFMPMIuAmq406d5UfZnuGcWlXZqOo=;
        b=Q6R2QpT0thW2pl0Tu+oQ4NCKHfGMP79CEIJUiu80rDnHW7gyiz7Hh3GhPETNlkZBKI
         8dmdHzQERejvdH8u5ozgwDVKfZ+6PpsUjt/sujAWXZ45wF/8Ex08lCdwFGnvQybjeWya
         R18nxpPfOJOXQnW44rrnVUKh+4E6eqeH1Ei1nw0B99N150dSruH3yBh/c/biLyfu/2do
         agQ7XlSZlGmIVAPHjoL/WQ0n1Ag9GvzLbS/vxruokZIoglqPFBHwuRqLg4ahqTqRUReT
         sV9Rtd4lVorFxzyy2KYPwdfidE3fMiNfbl5Ptsm1XGOADBfb8oeK/AwqDNRjQC8ENBXd
         Cqnw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v3 4/4] debugging: Remove redundant following sections introduction
Date: Sun, 12 Feb 2023 08:56:30 -0800
Message-Id: <20230212165630.26268-5-sj38.park@gmail.com>
In-Reply-To: <20230212165630.26268-1-sj38.park@gmail.com>
References: <20230212165630.26268-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj@kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A section in debugging.tex is introducing following sections twice.
Remove the redundant one.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 debugging/debugging.tex | 1 -
 1 file changed, 1 deletion(-)

diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index b7538620..191967ba 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2302,7 +2302,6 @@ to creep in, including:
 
 The first and fourth sources of interference provide conflicting advice,
 which is one sign that we are living in the real world.
-The remainder of this section looks at ways of resolving this conflict.
 
 \QuickQuiz{
 	But what about other sources of error, for example, due to
-- 
2.17.1

