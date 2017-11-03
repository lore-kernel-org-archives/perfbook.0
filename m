Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:52896 "EHLO
 mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932461AbdKCByQ (ORCPT <rfc822;perfbook@vger.kernel.org>); Thu, 2
 Nov 2017 21:54:16 -0400
Received: by mail-wm0-f54.google.com with SMTP id t139so2322033wmt.1 for
 <perfbook@vger.kernel.org>; Thu, 02 Nov 2017 18:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=mime-version:from:date:message-id:subject:to;
 bh=hGXCU56xnmD+bLI97tImgpY2K2XwtPQiQzLcdzIyInY=;
 b=etYfBBikDDoAW6UYDiz5d2K6RhKCHn3ZPCR4fCV1rywRaN1hpm0+2o5WooSsbMj3E2
 7npwFZszFwDVBT8iKcYsGLJswfrNajIEYrleu9N2zt1+wyacExe5o2rbCElD8Yh9cD6e
 ECA+2WBFY5FkFFAfENls7dJ+7oUqkvhYSbQvbZOeLNOnlbPKgRf586ejwuKCuqtmyA9T
 4I/DruQyQ10eTOx2ItdJQ7KM6FfVBe2ZsjuDuizyj5ft8Jm63h+q4o9C7WJBkhnckBBf
 bDZNubRboNA8tejClxGwFIMiwG8OC3FxYWDWSNwqsTXQV9lunYWgFbN/HEcCyoppimNt
 XFLA==
MIME-Version: 1.0
From: Yubin Ruan <ablacktshirt@gmail.com>
Date: Fri, 3 Nov 2017 09:54:15 +0800
Message-ID: 
 <CAJYFCiOuj6O18jBM=tWX6wxhXi4sskV-2WYYPvGLgU6LS3aH4w@mail.gmail.com>
Subject: Invalid compilation without -fno-strict-aliasing
Content-Type: text/plain; charset="UTF-8"
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Does anyone have any idea why this thread

    https://lkml.org/lkml/2003/2/25/270

is related to strict-aliasing? To me, a compiler barrier like this will fix it:

    if((stream + event_len) < ends) {
        iwe->len = event_len;
        barrier();
        memcpy(stream, (char *) iwe, event_len);
        stream += event_len;
    }

Yubin
