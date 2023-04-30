Return-Path: <SRS0=ummk=AV=gmail.com=sj38.park@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682869454; x=1685461454;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8ZX0R2PRb+ACviwYwJDG+LMDY082fwdIkBy68/ZpTQ=;
        b=iopd3dIZ1gHAf/dfGEFQqO4Glxp8/EAT0gJRs6nM40rEjahr2C2N2Y85/2FxVlc8Uc
         1m/RjpwIkNVafHdFtNyRzgiyDBFtjcB5H0R5W79fKIzofm5TE7ChzO9dv38wUrOFZPQZ
         Mmk2lpGB4DR4C3hMZR7Tcxr6Hon+JOnouTBAskHOugKhVk0G0I3bTU65je4iLOjLjnyK
         JnHH1GI4f1XhAoqBctOj19oB2zSTp+AyR9ACKbighVDUqli3lrKdajs9SEiHXZs6hfRy
         wYAtTd9YYhxiDhYXtKj+B1JCUYzfI5tJfjJZGHb8y2E4AWGQnSPP1BiqtXnu/M+kjaN7
         17AA==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH] together/refcnt: Use \qco{} for code quoting
Date: Sun, 30 Apr 2023 08:44:11 -0700
Message-Id: <20230430154411.28410-1-sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: akiyks@gmail.com, perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

\tco{} is for code in tabular environment, while \qco{} is for
non-breaking code with quotation marks.  However, commit 0e96cb8283ca
("together/refcnt: Use \tco{} for code quoting") has mistakenly used
\tco{} for quoted code, by mistake.  Fix it by replacing the \tco{} with
\qco{}.

Fixes: 0e96cb8283ca ("together/refcnt: Use \tco{} for code quoting")
Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/refcnt.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/together/refcnt.tex b/together/refcnt.tex
index 4abe1c60..11596f4e 100644
--- a/together/refcnt.tex
+++ b/together/refcnt.tex
@@ -467,15 +467,15 @@ as shown below.
 
 \QuickQuiz{
 	Why can't the check for a zero reference count be
-	made in a simple \tco{if} statement with an atomic
-	increment in its \tco{then} clause?
+	made in a simple \qco{if} statement with an atomic
+	increment in its \qco{then} clause?
 }\QuickQuizAnswer{
-	Suppose that the \tco{if} condition completed, finding
+	Suppose that the \qco{if} condition completed, finding
 	the reference counter value equal to one.
 	Suppose that a release operation executes, decrementing
 	the reference counter to zero and therefore starting
 	cleanup operations.
-	But now the \tco{then} clause can increment the counter
+	But now the \qco{then} clause can increment the counter
 	back to a value of one, allowing the object to be
 	used after it has been cleaned up.
 
-- 
2.17.1

