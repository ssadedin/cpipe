#!/usr/bin/env python
###########################################################################
#
# This file is part of Cpipe.
#
# Cpipe is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, under version 3 of the License, subject
# to additional terms compatible with the GNU General Public License version 3,
# specified in the LICENSE file that is part of the Cpipe distribution.
#
# Cpipe is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Cpipe.  If not, see <http:#www.gnu.org/licenses/>.
#
###################################################################################
#
# Purpose:
#   Converts hg19_refGene.txt to a bed file
#   ./refgene_to_bed.sh < refgene.bed > exons.bed
#   This is not part of the pipeline run and is an administrative tool
#
####################################################################################
python refgene_to_bed.py | sort -k1,1 -k2,2n > tmp$$
#$BEDTOOLS/bin/bedtools merge -i tmp$$ -nms | python refgene_to_bed.py post
bedtools merge -i tmp$$ -nms | python refgene_to_bed.py post
rm tmp$$
