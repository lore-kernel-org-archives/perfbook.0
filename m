Return-Path: <imrep.amz@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=from:to:cc:subject:date:message-id;
 bh=KRYJYLd6H8P9l5Xkn8IyBJt2pOikpFNBDdOShjIDaYA=;
 b=SdLQsHJdA3XHGAG2DMG6G4/laJUq2oNUOT3EwLIP40ExWPwOcjZ9GlFVRGOoRPyl9G
 cewyiY1Ah19se73yuz/vkId+t6KyyJii9wv/r7jTxIomr2UXNcQj3BQ54vGPnj4/fTcj
 KoCXbUjttEn7WZAS+cJ05+jxKBc1YUjb4parINzyIJndkCm3eP0Hz/QBKzO5nCfWFDfM
 aehL8KtgVlHEZb9iwwGWRdEtjGvDvtVpRRjvT2CWSbTGtutjgHOFJ9BbwU0KhWSL/iqR
 QR2t36Rcfseu+qqNHOWdmPkCot4/U4Ow5CPwSGsLwLgY4JaQxeLYeuZt++Sftrs1Z+8c
 e7gQ==
From: Imre Palik <imrep.amz@gmail.com>
Subject: Changing non-volatile access to volatile in counter examples
Date: Mon, 23 Jul 2018 22:07:24 +0200
Message-Id: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


This series changes some of the counter examples to use volatile access, to
avoid overly eager compilers/linkers to optimise out necessary reads/writes.

