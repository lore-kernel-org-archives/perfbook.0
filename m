Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:43371 "EHLO
 mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1756484AbbBJBnF (ORCPT	<rfc822;perfbook@vger.kernel.org>); Mon, 9
 Feb 2015 20:43:05 -0500
Received: by pdev10 with SMTP id v10so12845691pde.10 for
 <perfbook@vger.kernel.org>; Mon, 09 Feb 2015 17:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=date:from:to:subject:message-id:mime-version:content-type
 :content-disposition:user-agent;
 bh=yyOV8obtLjTp96G768dE585/CVH0GrTT/FqBo/Q+zHw=;
 b=HeOpSuztNOyMv9EatLQeu7IuA1fxD1cJ1SRnd0RPG2+MjfBu/F0SKEuNJsAj0EHLrr
 Rb9eruor0tm3kUI1C8vqRR7gZ3ibg6ubJOHo68lXaJs5ViR1nBPCPsIlzvbB0IwGmLW2
 qDJmxI+KkWPItRW9ymVG4ratV5+ye6k97HDDJIosIt3umaxumv+Nvb6RdM5XiTTW1/dt
 b9PKm4P7ZQSHDy5O10KWhkhSAKko6E05Rlcy7BxZj1uuBozgZns7MDZ8mWEftRCSxwCd
 0KE5FWMt6uUacp71TTKdlyHw0NhQzQKqVZsZNYwxPQWWc+uDUhxGt7EpVcmwhd6U3r2n
 SrWg==
Date: Tue, 10 Feb 2015 10:42:40 +0900
From: Namhyung Kim <namhyung@gmail.com>
Subject: rcu_read_unlock() in the nestable rcu based on free-running counter
Message-ID: <20150210014240.GA6334@danjae>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hi,

It says "Interestingly enough, the implementation of rcu_read_unlock()
is identical to that shown in Section 'RCU based on free-running
counter'".  However it seems not.. ;-)

Thanks,
Namhyung
