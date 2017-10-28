Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:56879 "EHLO
 mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1750803AbdJ1J2o (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 28
 Oct 2017 05:28:44 -0400
Received: by mail-pf0-f181.google.com with SMTP id b85so6709177pfj.13 for
 <perfbook@vger.kernel.org>; Sat, 28 Oct 2017 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent;        bh=E17RCsWhEva3f9QX5ECnRIMIAUl859OahWWHZHIMFEw=;
 b=parw0R3MA5Ek9y+pXI6uhV9ASJqAPOLMHPamPhGxtjslEHoU7HFvTVgRpAU66BXBjy
 CXQ4Z8o3KTtJukVyRKzUcQ7HQ9lnDPqQjVZkUBq56GeESim2f+z9aZ6PO0iUi+3LSJ70
 BDKCRlHyP8PjpxMhmZE0AxF/T3XOSg92fYUFZS3SuJwO7w2cTvWqGx9YK1EBxcUuBHz1
 LlJynxaSGrGjyzqL29ej8USkBttnmBJUUmsu3Dv2NFSbHodtf+BXDbMozxVxGcBx1bSQ
 La3pjeYW7SfshOy+MDzJHXMEMiIEgOgsaU2Y7ODjD6fwDAZ4nHW4b5TWXicBcktZvioj
 MQdA==
Date: Sat, 28 Oct 2017 17:29:34 +0800
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: Listing 9.2: actual free(3) will probably cause problem
Message-ID: <20171028092932.GG5742@HP>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi Paul,

I would suggest the following patch for defer/route_refcnt.c (as in Listing
9.2). For the change in re_free, if we actually call free(3) on `rep', we will
lose that piece of memory so that the READ_ONCE() at line 36 might see garbage
value and will probably will not call abort(3), i.e., that is implementation
specific behavior. And I don't see why will we have `old <=0`.

I think I understand what that code mean but you might mean some other?
Hopefully I will not be too picky.

Thanks,
Yubin

----------------------------------------
diff --git a/CodeSamples/defer/route_refcnt.c b/CodeSamples/defer/route_refcnt.c
index 8a48faf..0d24e9d 100644
--- a/CodeSamples/defer/route_refcnt.c
+++ b/CodeSamples/defer/route_refcnt.c
@@ -36,7 +36,8 @@ DEFINE_SPINLOCK(routelock);
 static void re_free(struct route_entry *rep)
 {
 	WRITE_ONCE(rep->re_freed, 1);
-	free(rep);
+    /* Will not actually free it. Just use the `re_freed' as a flag */
+	/*free(rep);*/
 }

 /*
@@ -50,7 +51,6 @@ unsigned long route_lookup(unsigned long addr)
 	struct route_entry **repp;
 	unsigned long ret;

-retry:
 	repp = &route_list.re_next;
 	rep = NULL;
 	do {
@@ -65,8 +65,6 @@ retry:
 			if (READ_ONCE(rep->re_freed))
 				abort();
 			old = atomic_read(&rep->re_refcnt);
-			if (old <= 0)
-				goto retry;
 			new = old + 1;
 		} while (atomic_cmpxchg(&rep->re_refcnt, old, new) != old);

