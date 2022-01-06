Return-Path: <SRS0=GtJ7=RW=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KHY5HlQMgy+9ZjH4RHSMibvdPEcKPNgdTHqi35J4+MA=;
        b=oUF17yZeQp+d/P/ZcxNnJOTLtAzyI3gwH13QlcZXxl8oA3CXFKvi4lUeQO2UDzCPz0
         L7XGXgux0LfW0Y9v1xM7RaDqQzI+G/azdABLrYnvfbxP5Ymyvv7Wd4gzuKHIRyHYKE0W
         IWS0sZ0G3+Y3o3fmHcHcz/uIz1v40g/EuRE2tZgj338RFbi27dmXlQC+Jut/+jChdoJt
         FxWZteV4dSyHQGEPSoo+fz+nUXHwN4gslh3+Lr15kZvUVbjm18NkI01U0cfYvuYeYbsl
         ct1fpKw8dqRsp+uE7HdQKtp+BxGkw8kSn+AfVeLGwtTPtK5NSS0INNopgDtWgcvyIWXn
         KI0g==
Subject: [PATCH RESEND -perfbook 06/10] datastruct: Add index tags for
 userspace-RCU APIs
References: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <da93dd20-9345-5676-dde0-cb3efcbd5e69@gmail.com>
Date: Thu, 6 Jan 2022 16:39:40 +0900
MIME-Version: 1.0
In-Reply-To: <d61bf71a-d3ed-1561-62ee-15d4537443da@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 datastruct/datastruct.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
index 7186b611..99da03bf 100644
--- a/datastruct/datastruct.tex
+++ b/datastruct/datastruct.tex
@@ -493,8 +493,8 @@ shows \co{hashtab_lookup()} for the RCU-protected per-bucket-locked
 hash table.
 This is identical to that in
 \cref{lst:datastruct:Hash-Table Lookup}
-except that \co{cds_list_for_each_entry()} is replaced
-by \co{cds_list_for_each_entry_rcu()}.
+except that \apiur{cds_list_for_each_entry()} is replaced
+by \apiur{cds_list_for_each_entry_rcu()}.
 Both of these primitives traverse the hash chain referenced
 by \co{htb->htb_head} but \co{cds_list_for_each_entry_rcu()} also
 correctly enforces memory ordering in case of concurrent insertion.
@@ -545,12 +545,12 @@ shows \co{hashtab_add()} and \co{hashtab_del()}, both of which
 are quite similar to their counterparts in the non-RCU hash table
 shown in
 \cref{lst:datastruct:Hash-Table Modification}.
-The \co{hashtab_add()} function uses \co{cds_list_add_rcu()} instead
-of \co{cds_list_add()} in order to ensure proper ordering when
+The \co{hashtab_add()} function uses \apiur{cds_list_add_rcu()} instead
+of \apiur{cds_list_add()} in order to ensure proper ordering when
 an element is added to the hash table at the same time that it is
 being looked up.
-The \co{hashtab_del()} function uses \co{cds_list_del_rcu()} instead
-of \co{cds_list_del_init()} to allow for the case where an element is
+The \co{hashtab_del()} function uses \apiur{cds_list_del_rcu()} instead
+of \apiur{cds_list_del_init()} to allow for the case where an element is
 looked up just before it is deleted.
 Unlike \co{cds_list_del_init()}, \co{cds_list_del_rcu()} leaves the
 forward pointer intact, so that \co{hashtab_lookup()} can traverse
-- 
2.17.1


