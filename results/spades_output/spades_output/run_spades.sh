set -e
true
true
/usr/local/bin/spades-hammer /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/corrected/configs/config.info
/usr/local/bin/python /usr/local/share/spades/spades_pipeline/scripts/compress_all.py --input_file /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/corrected/corrected.yaml --ext_python_modules_home /usr/local/share/spades --max_threads 16 --output_dir /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/corrected --gzip_output
true
true
/usr/local/bin/spades-core /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K21/configs/config.info /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K21/configs/careful_mode.info
/usr/local/bin/spades-core /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/configs/config.info /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/configs/careful_mode.info
/usr/local/bin/python /usr/local/share/spades/spades_pipeline/scripts/copy_files.py /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/before_rr.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/before_rr.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/assembly_graph_after_simplification.gfa /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/assembly_graph_after_simplification.gfa /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/final_contigs.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/contigs.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/first_pe_contigs.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/first_pe_contigs.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/strain_graph.gfa /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/strain_graph.gfa /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/scaffolds.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/scaffolds.fasta /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/scaffolds.paths /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/scaffolds.paths /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/assembly_graph_with_scaffolds.gfa /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/assembly_graph_with_scaffolds.gfa /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/assembly_graph.fastg /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/assembly_graph.fastg /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/K33/final_contigs.paths /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/contigs.paths
true
true
/usr/local/bin/python /usr/local/share/spades/spades_pipeline/scripts/correction_iteration_script.py --corrected /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/contigs.fasta --assembled /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/misc/assembled_contigs.fasta --assembly_type contigs --output_dir /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output --bin_home /usr/local/bin
/usr/local/bin/python /usr/local/share/spades/spades_pipeline/scripts/correction_iteration_script.py --corrected /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/scaffolds.fasta --assembled /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/misc/assembled_scaffolds.fasta --assembly_type scaffolds --output_dir /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output --bin_home /usr/local/bin
true
/usr/local/bin/python /usr/local/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/scaffolds.fasta --misc_dir /Users/hayoungannacho/my_first_wf/work/91/a9498bccc95806b6e1dc02d446249e/spades_output/misc --threshold_for_breaking_scaffolds 3
true
