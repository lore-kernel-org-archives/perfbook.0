Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35354 "EHLO
 mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752304AbdBMNZH (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 08:25:07 -0500
Received: by mail-oi0-f67.google.com with SMTP id x84so7303376oix.2 for
 <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 05:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=jpUupm9tJUdJszsOG4abStNvIC7JTUwwB3CCh2V8SNg=;
 b=p/TscO64gdBly2AcdPkqb/ytLBRLJaj1JOhuv0239AL38VrGLled2E08eaq9+A2dh7
 YjfS0wSxMpOhP2QVWDisIFkTu5alxBfEHBfy2IMwhGV38sxNCnlYHRed5xhVQbwBPwnR
 stwQ4MBLF3N2GUzMF/HnXleq6sTQeO3ORf3TZgMtG+wZe8IkD0Ej0Fh1QrOYi5/VRDf8
 VTtPe0r3a/++n6sMDi/zFXTqIc7YIigJ14ygi8tqfrOW21B7+/Cj8KG8xivAWAAzYxMB
 LSR7fE/LMuI+vZGQHV8VtN6zM6Og6J8L2zFpuUSUjHenfizWtUwOWSXfUBzShd99cg09
 fu2w==
Received: from [192.168.1.106] ([110.64.91.54]) by smtp.gmail.com with ESMTPSA
 id e7sm21317575pgp.2.2017.02.13.05.24.58 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Mon, 13 Feb
 2017 05:24:59 -0800 (PST)
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [Typo] Quick quiz B.13 typo
Message-ID: <7b82c257-889e-10bf-b6be-4042cd09aaae@gmail.com>
Date: Mon, 13 Feb 2017 21:24:52 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

perfbook 2017.01.02a:

Quick Quiz B.13:
     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an 
interrupt handler, and that the CPU 2's line 9 is run
                                               ~~~~~~~~~
                                               typo here

regards,
Yubin Ruan
