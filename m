Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:44932 "EHLO
 mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932085AbdJUN6O (ORCPT <rfc822;perfbook@vger.kernel.org>); Sat, 21
 Oct 2017 09:58:14 -0400
Received: by mail-wm0-f42.google.com with SMTP id 196so3475673wma.1 for
 <perfbook@vger.kernel.org>; Sat, 21 Oct 2017 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=+tBI1hQ9iN+F8tLkQDFdHw0lL0KFfQiEtXXfrk8NTAo=;
 b=iYqiafLb+PqgM0jnkbrPPn/bM2544kpRZN3P+ls9cjk70KV2Ge2F+LT/gzOlxkYzf2
 jex6sekoxDeRvyLPi1kUib8mqQmrguGmDkocNsp2KWdUccQdUFAk5J6d9Z8RK5A9FEg3
 lJFRyMlb8BHvivtA544eLSExzAQleN6Kkx4HRYHl4UPIgIZYuqPJD/AK7Ukr2rhrDWUW
 j0hyEm7c5ik9seG9cKpRQMhSiYVTflKnj16m8Aa8t0D1tyOUUwJb7JWrYp6QoPo2pMgq
 9fAnnhkKC1OEdZoQzMaTkRtNQwz3x2PmHtp8VloriVgE2Qj4GIum/ZGIKAxppV9oF+ws
 7qwA==
MIME-Version: 1.0
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Sat, 21 Oct 2017 21:58:12 +0800
Message-ID: 
 <CAJYFCiPGe4NaZMef_-gXF4Oyk8tP+DhmPYfrhgvEEHzTnmm59g@mail.gmail.com>
Subject: Probably redundant code at listing 7.7
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

In Listing 7.7, a hierarchy/conditional locking example is used to
show how to reduce how contention:

1 void force_quiescent_state(struct rcu_node *rnp_leaf)
2 {
3      int ret;
4      struct rcu_node *rnp = rnp_leaf;
5      struct rcu_node *rnp_old = NULL;
6
7      for (; rnp != NULL; rnp = rnp->parent) {
8          ret = (ACCESS_ONCE(gp_flags)) ||
9                  !raw_spin_trylock(&rnp->fqslock);
10         if (rnp_old != NULL)
11             raw_spin_unlock(&rnp_old->fqslock);
12         if (ret)
13             return;
14         rnp_old = rnp;
15     }
16     if (!ACCESS_ONCE(gp_flags)) {
17         ACCESS_ONCE(gp_flags) = 1;
18         do_force_quiescent_state();
19         ACCESS_ONCE(gp_flags) = 0;
20     }
21     raw_spin_unlock(&rnp_old->fqslock);
22 }

I understand the purpose and most of the implementation of the code.
But one thing I don't really understand is that why we need line 16
here? By reaching line 16, we can be sure that that particular process
have already acquired the fqslock of the root node and it should be
the only one to reach there. So, it will always see gp_flags == 0 when
reaching line 16.

Did I miss anything? I read Quick Quiz 7.21 and it seems that there
might be some tricky things there.

Yubin
