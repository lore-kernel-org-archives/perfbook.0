Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:35292 "EHLO
 mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1752271AbdBMN4C (ORCPT <rfc822;perfbook@vger.kernel.org>); Mon, 13
 Feb 2017 08:56:02 -0500
Received: by mail-oi0-f65.google.com with SMTP id x84so7432381oix.2 for
 <perfbook@vger.kernel.org>; Mon, 13 Feb 2017 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=jI01QJ4MZw9iyAR08JrMtAgQuymmxuiiBW/ONhjKkac=;
 b=UUmxFvJ3+OX/GgOGLTYnV+Ikpe1mqh4lBaD8zFECBiwX5uJJD0blljx3z2sStIY7xV
 +vOMMAW/Kob1dE08MgTfA9E55W21vKXMmVlHDuXnXF2uYP+eVWFbOYWL4C1cYV0XEoWf
 LfuSTrdwjrYnZISkLEczt0u3PHqcwVUiItS3BWjzJRWJSwTFKxqS25mrjK5ByMzJgO5l
 ezQAGNa6QsRLMz7EZiRMRRryYgY9OgNRiizZ27NXy0MziIAODp46B2VrlsSAqTsfqNVW
 biSMXqUDLPKyeHP7n08SfIkEBMxnonyhhF5e8Tr+JC3AWjquGPfvHZp8IWpdFULaiX7J
 yJOA==
Received: from [192.168.1.106] ([110.64.91.54]) by smtp.gmail.com with ESMTPSA
 id p4sm15095625pgd.50.2017.02.13.05.55.57 for <perfbook@vger.kernel.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Mon, 13 Feb
 2017 05:55:59 -0800 (PST)
From: Yubin Ruan <ablacktshirt@gmail.com>
Subject: [Question] different kinds of memory barrier
Message-ID: <881f369d-4e5b-a335-6359-c5d7bf1bc086@gmail.com>
Date: Mon, 13 Feb 2017 21:55:50 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

It have been mentioned in the book that there are three kinds of memory 
barriers: smp_rmb, smp_wmb, smp_mb

I am confused about their actual semantic:

The book says that(B.5 paragraph 2, perfbook2017.01.02a):

for smp_rmb():
     "The effect of this is that a read memory barrier orders
      only loads on the CPU that executes it, so that all loads
      preceding the read memory barrier will appear to have
      completed before any load following the read memory
      barrier"

for smp_wmb():
     "so that all stores preceding the write memory barrier will
      appear to have completed before any store following the
      write memory barrier"

I wonder, is there any primitive "X" which can guarantees:
     "that all 'loads' preceding the X will appear to have completed
      before any *store* following the X "

and similarly:
     "that all 'store' preceding the X will appear to have completed
      before any *load* following the X "

I know I can use the general smp_mb() for that, but that is a little too 
general.

Do I miss/mix anything ?

regards,
Yubin Ruan
