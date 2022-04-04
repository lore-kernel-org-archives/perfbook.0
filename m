Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=HdNy/wIfkTTdjnDKDEGWnmislLU1g2RzhR/S1Af0FOk=;
        b=BChlO2DEb3/66EOqtGx2tb+dV7VJD0k9h8IbxvumCYDavkTWulmARed7/WDadv1OK0
         INcJsAcrT2sOPB3Jfdx4Nh7EyHLvMjPDGvpJUCL5r76b5107RtjwMe2JJcLfN3cMBh3k
         Gpde1SNzK4g2PYIn4U2S7vgkgNPwtzO1i2EQo1pN6+d1I4/z8DS+p0jkosw6ROMBN6e7
         Xi+2g0XVjUS4/nCrPywo9xmpgUtI698SJD5o/6H+e5+lE/QV6KZAawAlt8fAjKxTQAvg
         nOTJT5ktiKHv4EBya8/KPEYksCrkOQ/LUE8X2YiGiP+jKob+MiHvLY38TO15KAB7xu1+
         4HQg==
Message-ID: <c1a39b48-6a99-9317-a074-e72bb45b374a@gmail.com>
Date: Mon, 4 Apr 2022 09:00:18 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 0/3] punctcheck.pl updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So, this series adds patterns in punctcheck.pl to detect misuses
of punctuation markers "\@.", ".\@", and its friends.

Patch 1/3 adds the new pattern.
Patch 2/3 adds hint messages to help you and other contributors
see what is wrong.  Hopefully the added messages are clear enough.
Patch 3/3 fixes existing misuses detected by the added pattern.

        Thanks, Akira
--
Akira Yokosawa (3):
  punctcheck.pl: Add pattern to catch reverse use of period markers
  punctcheck.pl: Add hints in complaint messages
  Fix period markers

 glossary.tex            |  2 +-
 memorder/memorder.tex   |  2 +-
 together/applyrcu.tex   |  2 +-
 utilities/punctcheck.pl | 15 +++++++++++++++
 4 files changed, 18 insertions(+), 3 deletions(-)


base-commit: 5f28b7cb0d4c447c9d6397770906c7cb4c96832c
-- 
2.25.1

