Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235409AbhHQKPd (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 17 Aug 2021 06:15:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1E4C061764
        for <perfbook@vger.kernel.org>; Tue, 17 Aug 2021 03:15:00 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso4322807pjb.2
        for <perfbook@vger.kernel.org>; Tue, 17 Aug 2021 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=rZJM07qvm+ycoihC6asj7N443DJuze5qDMQd+i4n8RU=;
        b=rcZ3lhBLVIR9wWwkZzSN31XdtFzQL/mDmRmIVivPGKyl17nwtkwBvuPA1emnkKVgTo
         xiFrJ4zxJmRevEmixjVtbZq4d4Ke48Xt6lCmshyQIMl6TGL1hteniE153D4ldb+UPe2Q
         Eg22HtJPAmwqw8jvcCcZE/CjgcgDIe/Ms7/pV4uWTSgoUcD+vwZWq3BFoQCKdRYvI+Bf
         mdy+t3GsEtNF3CYPA+V3af21rM5+iGlrgtMOBSO2BSkX1CXBM94DceqSllUuRKopmxtq
         tj7A3iMHCIOHtEC5AFhKVcTPO8B+FweffPJPyLVrjjfy6qYhV2sGb+QdpPxo9UmLDTHP
         i6FA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 00/11] Break and capitalize after colon, take four
Message-ID: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
Date: Tue, 17 Aug 2021 19:14:56 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <perfbook.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

Hi Paul,

This is the final round of colon-related fixes.

Patch 1/11 does the same changes in appendices and glossary as before.
Patch 2/11 fixes a trivial-looking typo.
Patch 3/11 fixes remaining violations detected by the updated scripts.
Patch 4/11 improves definition of \IfEbookSize and \IfSansSerif so that
they are safe to be used in the middle of a paragraph.
Patch 5/11 fixes inline-enumerate list containing \co{}.
This is similar to the issue of \co{} inside tabular cells.

Patches 6/11--10/11 are updates of check scripts.
(Please refer to change logs for what they are after.)
Patch 11/11 renames make target "periodcheck" to "punctcheck"
as it checks punctuation-related conventions not limited to
periods. 

        Thanks, Akira

--
Akira Yokosawa (11):
  appendix, glossary: Break and capitalize after colon
  glossary: Put missing question mark
  treewide: Adjust punctuation convention
  Add \ignorespaces command to \IfEbookSize and \IfSansSerif
  datastruct: Use \tco{} inside inline enumerate list
  periodcheck: Add colon-related checks
  cleverefcheck: Check lower-case word after \item
  periodcheck: Improve regex
  periodcheck: Use counter to prevent false negatives
  cleverefcheck: Add pattern to catch missing '\' in indexing macros
  Makefile: Rename periodcheck --> punctcheck

 Makefile                                    | 14 +++--
 SMPdesign/beyond.tex                        |  5 +-
 appendix/questions/after.tex                |  2 +-
 appendix/styleguide/styleguide.tex          |  5 +-
 appendix/toyrcu/toyrcu.tex                  | 11 ++--
 appendix/whymb/whymemorybarriers.tex        | 24 ++++----
 count/count.tex                             |  2 +-
 datastruct/datastruct.tex                   | 19 +++---
 defer/rcufundamental.tex                    |  4 +-
 future/formalregress.tex                    |  2 +-
 glossary.tex                                | 14 +++--
 perfbook-lt.tex                             |  6 +-
 utilities/cleverefcheck.pl                  | 65 ++++++++++++++-------
 utilities/{periodcheck.pl => punctcheck.pl} | 65 ++++++++++++---------
 utilities/{periodcheck.sh => punctcheck.sh} |  3 +-
 15 files changed, 143 insertions(+), 98 deletions(-)
 rename utilities/{periodcheck.pl => punctcheck.pl} (52%)
 rename utilities/{periodcheck.sh => punctcheck.sh} (87%)

-- 
2.17.1

