Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:36000 "EHLO
 mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751472AbdBMNl4 (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 08:41:56 -0500
Received: by mail-ot0-f195.google.com with SMTP id 36so11388573otx.3 for
 <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 05:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=P/HB2O19OdSVReJtVXW1PKqwj9/9EBos8AOU2T/PlVQ=;
 b=f//gv9GA2ALwAY09gBtrVgwLuYZiIrWaZ9hzv4+1+pA+EQkJTJ/PJ/8GO1vBXH+01N
 bVGFmqahrMyPSdvV9dEKeDKKETlibFdXUhHw+rmcRXongxgekMfjR7uRlQyvT+pDg6vr
 qDwD1qqfzYOJAHSKozYHxTV1yq5eIoFq8yb1HqwQzk4Q6jp90lfRbUUPUWRsNiwEj2Ac
 QKugoQCYjr9xM+7iop/iXg8DAosbDNWORuRp5DEGPXUvVWxrpp7NOKJWFIs8g0ZFGKx/
 OLkyEftuAQZTMqcclrBva9wAiMMHf0Enc539l6GkoOzqPcz4KTeKKQErN4C9hjdvnAmp
 JLiw==
Received: from [192.168.1.106] ([110.64.91.54]) by smtp.gmail.com with ESMTPSA
 id l71sm21329634pga.13.2017.02.13.05.41.53 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Mon, 13 Feb
 2017 05:41:54 -0800 (PST)
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [Question] Quick Quiz B.13 help
Message-ID: <3fabc59b-f542-a121-3764-c4ac9eedc062@gmail.com>
Date: Mon, 13 Feb 2017 21:41:46 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Quick quiz B.13:
     Suppose that lines 3-5 for CPUs 1 and 2 in Table B.4 are in an 
interrupt handler, and that the CPU 2's line 9 is running at process 
level. What changes, if any, are required to enable the code to work 
correctly, in other words, to prevent the assertion from firing?

I can not come up with any practical material for this quiz, because I 
don't really know the implication of "in an interrupt handler", and 
"running in process level".

The answer hints that one would need to ensure that the load of "e" 
precedes that of "a" and hint the Linux kernel implementation 
"barrier()". But how is that exactly? I am going to invest some time 
into the Linux kernel implementation. But I would really appreciate some 
hints about this, as I don't have so much kernel development experience 
before.

regards,
Yubin Ruan
