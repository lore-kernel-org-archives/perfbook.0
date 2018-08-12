Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from gusty.araneus.fi ([185.55.84.130]:64486 "EHLO gusty.araneus.fi"
 rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP id S1727683AbeHLXe6
 (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 12 Aug 2018 19:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=gson.org; s=mail;
 t=1534106839; bh=b6qKDIVcPNIf7kKNM+nYWQ+4Lf0x/vEnBg77SDr9fqI=;
 h=Date:To:Subject:From;
 b=hy1gRNL/LNwzcWFcs075DQYLJoYiNKuxQ1YpOuNtyR/eFsh3zJooCGHY6lKDHXSut
 8H5Pqq4sjXMxq1Unif7dx3Zpz4iakRYqebB18lWHW+Ld4nrMcEl1qj0ziHzgVSgpkH
 u8+JsgfbIrrgL/ycuEDvGUl/Yf0b4ap3uOma5hP8=
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <23408.40149.473045.271221@guava.gson.org>
Date: Sun, 12 Aug 2018 23:47:17 +0300
Subject: memory_order_explicit
From: Andreas Gustafsson <gson@gson.org>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

perfbook/toolsoftrade/toolsoftrade.tex says:

  For example, ``\co{memory_order_explicit(&a, memory_order_relaxed)}''
  is vaguely similar to the Linux kernel's ``\co{READ_ONCE()}''

I'm no expert on the C11 atomics, but as far as I can see, there is no
such function as "memory_order_explicit".  Did you perhaps mean to say
"atomic_load_explicit"?
-- 
Andreas Gustafsson, gson@gson.org

