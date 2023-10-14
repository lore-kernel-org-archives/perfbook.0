Return-Path: <SRS0=1PbI=F4=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697272628; x=1697877428; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHrKK2vlbjjH+8klcCHFF3l4EEts2DBR4L6EJo3ezGk=;
        b=D8UDUdCrfwokF6jEfrvzK8Wny/dHR07M04F7IcXzAfHqhJ6FDpLs7372ZbuX4b3/Bc
         rUKtrAI9mglBLarCNEexJsCS1giFfhGwwe2USPnnSxkoXAX2114a9eojZCTWhKsKRfTc
         sAh9v/SSTqrtuH2BJR6mN2bZ3WsSZNYoyHNaD4lNK4LRzlKkC6sNHSKoIOGxRhYtD8WB
         XrwnYMNV4iGpbM4olO1EcapwLZ1ZiBoG2v2bekS6ngQIG6QBmJRUIBiM6pXAwJ4tm6A+
         iK5wze9M8Fuq0K7+yW+0IQL14IotL1ffS6EWeKB4Y5IbTO4YTHdGoYHqj0dwGvXB/uCW
         lOtQ==
Message-ID: <91cf01c3-3e67-4763-ab27-9070e50cb245@gmail.com>
Date: Sat, 14 Oct 2023 17:37:04 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook v2 0/3] memorder: Add info on recent x86
 implementation of smp_mb()
References: <20231013012238.1455140-1-joel@joelfernandes.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20231013012238.1455140-1-joel@joelfernandes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Joel,

So this is v2 based on your patch.

As is often the case in perfbook workflow, I split the bib
update into Patch 1/3.

Patch 2/3 includes much more changes than I thought.
Please see notes under "---".

Patch 3/3 is my own adjustment of the paragraph in front of
your update.

And I dropped "Cc: Paul", as Paul is the one who will be in
the SOB chain.

        Thanks, Akira
--
Akira Yokosawa (1):
  memorder: Update of ordering SSE non-temporal memory move instructions

Joel Fernandes (Google) (2):
  bib/memorymodel: Add Tsirkin2017
  memorder: Add info on recent x86 implementation of smp_mb()

 bib/memorymodel.bib   | 10 ++++++++++
 memorder/memorder.tex | 16 ++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)


base-commit: a01629a5f734b7617ee0ac4d4ded28b0605cf7cd
-- 
2.25.1


