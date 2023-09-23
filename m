Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486851;
	bh=MhxIPZzLJFP7tg9a86VFaxX/tbXc2xEH5ssw5JLtkiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ODitdiLnVeu+rNoKyQloWtLPBN5wTk16CKwrs3SOMQT4vyVtXzmPlveE3PY/5dB/W
	 hwzgiN6kzrfhx13R/MGZJzupI+5Zye0J4XWEKmX7tRZEk+/JhXsZYGLku+I5LA5I+h
	 Xb3uXez9bBJvg8hbOlj27EPJPS882V4oFmZze0AawdGZHj6CrsESkTFXmPFyWUeopN
	 37Mod4j72waAw46uUsjf0YLjZoXaxMmlcXRLkSm/0+jaRJN62/QHLgoa9eYvl0V1zA
	 NFj7HuqaGPb6ks/0c17GbPYO96N8Q+epZaZEO0NWWUupj4zYtUgP1CnluRALhv32+9
	 xitzJFTt6Y0eA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 02/10] memorder/memorder: Add a missing space between column name and 'column'
Date: Sat, 23 Sep 2023 09:31:56 -0700
Message-Id: <20230923163204.14558-3-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

A sentence in memorder.tex is missing a space between the column name
and 'column'.  Add it.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 75e336dc..ba921ad8 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1148,7 +1148,7 @@ are at most two threads involved.
 
 	The \co{WRITE_ONCE()} row captures the fact that accesses to
 	a single variable are always fully ordered, as indicated by
-	the ``SV''column.
+	the ``SV'' column.
 	Note that all other operations providing ordering against accesses
 	to multiple variables also provide this same-variable ordering.
 
-- 
2.17.1

