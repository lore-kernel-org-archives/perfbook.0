Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C8DErZmTZd+zRhKueaLNCXoyzsyrqkbb+OzKbAMqbE0=;
 b=QMHZRBoGiYjQ27D+T4kuJOF8JRVcBGcZusYf1B79v0jOXseFQ5kO21fJwlMbDe2WSk
 APc8AtL+N/aMTTcRPA/Dc1pzxZe5Kv9rwCq+2iTw0dFb0nnPJK6GXW2PYbSiYcNrZyL/
 CW50vs/oHAQxzLxvLnXxAdbCg8N9nCfcr2d3YhPQIGGzwf97Wa6kbtYROrL4cWHlSXrU
 MB+XcAlNJ3q7LtsZ32xQxIira5hJ9HmvnNbqjes3LdsiFg4G0OQtEPyF9SMdXax2w7cR
 554lc4FEokZnbtpHR5CVVtOSUtbx6D7OnjqtrUDgXsycHbTp3EF0VHvbkPygQ9kFabvR
 7q9Q==
From: SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 6/8] together: Fix a wrong field citation
Date: Tue, 11 Oct 2016 08:07:36 +0900
Message-Id: <20161010230738.14452-7-sj38.park@gmail.com>
In-Reply-To: <20161010230738.14452-1-sj38.park@gmail.com>
References: <20161010230738.14452-1-sj38.park@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>
List-ID: <perfbook.vger.kernel.org>

A sentence is pointing out ->a[] field while it should point out ->fa
field by its context.  This commit fixes the wrong field citation.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 together/applyrcu.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/together/applyrcu.tex b/together/applyrcu.tex
index 86471633a64a..60d489c3b7bb 100644
--- a/together/applyrcu.tex
+++ b/together/applyrcu.tex
@@ -465,7 +465,7 @@ length~\cite{Arcangeli03}.
 \item	CPU~0 loads the value of \co{->fa->length}, obtaining the value 16.
 \item	CPU~1 shrinks the array to be of length 8, and assigns a pointer
 	to a new \co{foo_a} structure containing an 8-character block
-	of memory into \co{->a[]}.
+	of memory into \co{->fa}.
 \item	CPU~0 picks up the new pointer from \co{->a[]}, and stores a
 	new value into element 12.
 	But because CPU~0 is still referencing the old \co{foo_a}
-- 
2.10.0

