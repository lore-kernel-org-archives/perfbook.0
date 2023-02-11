Return-Path: <SRS0=d1CH=6H=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SDvX3h5F0p0JeMAPWOuFRuZaQnsweiP5sZlkXvbBbfc=;
        b=lAqcoi5ZBg1Bc9UikOQFiavm08Ca0G4eGDKLUC15RISLNfu67fvDbTNZscXkdNss+y
         ZSK1kkvOyPv7j3hEJSrzu3H6oTeeT77/WILD2XQ0RAQ4dmux/1uCpsJamyIwalqOfiBK
         B42V1s4yFjNeHa/l25u6ZdfYNiIWYxwsXe1UU6RGJ75opK02fm6bEAw1v/Gh2WI/klvT
         YuaZFoNajV+8aVLLgEfMdT/Hnl//hqav5/9xuuiKaYaK3UNbOEy7aMyXNBYe+ZS/iHaL
         +3RIFVkBoxOZ64+bvv5oXzLeB2wrsPbPjW6MZWvjJEZAfgmhXcMAaVyt+Q/8Wc02JgQs
         R+Gw==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2 2/4] debugging: Use \co{} and \qco{} for 'git' and 'Fixes:', respectively
Date: Sat, 11 Feb 2023 09:10:06 -0800
Message-Id: <20230211171008.9415-3-sj38.park@gmail.com>
In-Reply-To: <20230211171008.9415-1-sj38.park@gmail.com>
References: <20230211171008.9415-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, sj38.park@gmail.com, sj@kernel.org
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

