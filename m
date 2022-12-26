Return-Path: <sj@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672078620;
	bh=Mxcb8DZ+rpTggmSsy2TXRxciS7U6aYb9I2b3rDyjJhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kc7u13O8TgfvgIg/1tHr0eQPPdo/AosnDKDbYAFi5LwBO4jJ83oisYxEJH2dIGxYg
	 Mzqb+jF6O4/rLcWegjU0cNqWF1CL8G9GcjtIH+8zrxnDzLuD6EIRcLdDKPXbxagWha
	 bX/QTquLizmw4e6JxTuKpoVLhhLf8+FI5CojcweVK1G+H7z2hxmJ70s5CnubjYWe2a
	 CBkamYkXwmnvtJUnSnFYFaQDBJ0IXdAFzzJEPk89a7eYRBAN9MuNqVCVjl3FvkCBEm
	 uhaSdDxZqTp/gjmB5xjqlParCNFAjvQ8+3dHU8xIJi+BUUd4OX25kdp5fxroTlmQPD
	 NnCgrXh07auJA==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 3/4] datastruct: Enclose NULL with \co{}
Date: Mon, 26 Dec 2022 10:16:33 -0800
Message-Id: <20221226181639.10795-4-sj@kernel.org>
In-Reply-To: <20221226181639.10795-1-sj@kernel.org>
References: <20221226181639.10795-1-sj@kernel.org>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: SeongJae Park <sj38.park@gmail.com>

Every 'NULL' in datastruct are enclosed with \co{} but one.  Remove the
inconsistent exception.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 datastruct/datastruct.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 40ea6995..9dffaf37 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -1532,7 +1532,7 @@ and \clnref{acq_oldcur} acquires that bucket's spinlock.
 	\co{hashtab_add()} and \co{hashtab_del()}?
 	In other words, what prevents \co{hashtab_add()}
 	and \co{hashtab_del()} from dereferencing
-	a NULL pointer loaded from \co{->ht_new}?
+	a \co{NULL} pointer loaded from \co{->ht_new}?
 	\end{fcvref}
 }\QuickQuizAnswer{
 	\begin{fcvref}[ln:datastruct:hash_resize:resize]
-- 
2.17.1

